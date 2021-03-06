---

title: "Pusher notifications with EventMachine"
id: 4e258a01dabe9d7285017e6b
updated: 2011-08-30T19:31:24-04:00
date: 2011-08-30T18:55:00-04:00
tags:
- code
redirect_from: /blog/archives/2011/08/30/pusher-notifications-with-eventmachine/
---

[Gaug.es](http://gaug.es) has been a fun exercise in building an app to scale from the start. [John Nunemaker previously posted about our quest](http://railstips.org/blog/archives/2011/05/04/eventmachine-and-passenger/) to send live updates to the browser without slowing down the request cycle.

Backstory
---------

We use [Pusher](http://pusher.com/) to send realtime updates of stats to the Gaug.es dashboard. We started out on Heroku–which uses Thin, which runs on EventMachine–so we could just use EventMachine and Pusher's `trigger_async` method to queue the Pusher update on the next tick, thus not affecting response times. But then we moved from Heroku to [RailsMachine](http://railsmachine.com/) and their Passenger stack, so we wanted to find a way to keep the Pusher update out of the request cycle but still "realtime".

So John devised a genius plan of starting up a thread in Passenger that runs EventMachine. We can still use the `trigger_async` method and take advantage of EventMachine's IO goodness, and only suffer hits in response time occasionally when Ruby's naive thread scheduling interrupts the passenger process in the middle of a request.

It ~~didn't~~ *did* work
------------------------

This ran great in production for a few weeks. But as our traffic started to increase thanks to launching several new features, we started to run into problems. Passenger processes frequently started hanging and gobbling up ungodly amounts of CPU. The only way to recover was to snipe the processes with the friendly `kill -9`.

So we tried to concoct a theory: since most of our hits are ridiculously fast (5-10ms), and we were running multiple threads but weren't doing anything fancy to set priority or control scheduling, the passenger thread must be handling requests faster than the EventMachine thread can send them to Pusher, causing the Event Machine thread to get backed up to the point where it has so many IO connections open that it thrashes the CPU.

It turns out our theory was wrong (we were actually hitting a [crazy bug with the regex engine in all major versions of Ruby](https://gist.github.com/1079284)), but we didn't know that at the time. So we concluded that we had to take the Pusher notification out of the request cycle.

Redis and EventMachine to the rescue
------------------------------------

With help from [Chris Gaffney](http://twitter.com/gaffneyc), I came up with a different approach that pushes hits on a Redis list and uses a separate EventMachine process to send them to Pusher.

In our Sinatra application, we just push JSON from the notification onto a list.

{% highlight ruby %}
Gauges.redis.rpush('notifications', notification.to_json)
{% endhighlight %}

Redis list operations are fast, even with a decent-sized blob of text. Now our app doesn't have to worry about the overhead of sending the notifications.

Next we needed background process to process the Redis list and communicate with Pusher. EventMachine is well-suited for all of this IO, so we wrote this simple script:

{% highlight ruby %}
module Gauges
  module Pusher
    def self.redis
      @redis ||= EM::Hiredis.connect("redis://localhost:6379")
    end

    def self.next
      redis.blpop('notifications', 0).callback do |list, data|
        notification = JSON.parse(data)
        channel = notification.delete('channel')
        ::Pusher[channel].trigger_async('hit', notification)
        EM.next_tick(&method(:next))
      end
    end
  end
end

EM.run do
  Gauges::Pusher.next
end
{% endhighlight %}

It uses em-hiredis to connect to Redis and run a blocking left pop, which will wait until there is an item on the list and then send the notification to Pusher with `trigger_async`. It then re-schedules itself to run on the next tick, causing it to continuously loop.

This has been working really well for us in production for a couple months now. The biggest disadvantage currently is if the process ever dies and notifications start to build up, Pusher will get inundated with requests form us because it will send them as fast as Redis can pop them off the list. We will eventually look into adding some rate-limiting.
