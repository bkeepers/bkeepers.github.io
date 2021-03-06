---

title: "How to test dependencies on external services?"
id: 4cf5b672dabe9d2c610003cd
updated: 2010-11-30T21:44:02-05:00
date: 2007-04-25T15:35:00-04:00
tags:
- code
redirect_from: /blog/archives/2007/04/25/how-to-test-dependencies-on-external-services/
---

I've been writing a lot of code lately that depends on external services, and I've really been struggling with how to test it well.

### Tinder

The tests for [Tinder](http://tinder.rubyforge.org), the unofficial [Campfire](http://campfirenow.com) "API", are pathetic. Partially because it was originally just a proof of concept and partially because I just didn't have a clue about how to write tests that would actually tests and not just execute the code.

The problem with Tinder is that it is really hard to isolate the tests. By default, every test will have 2 points of failure, the code to set up the test and the code to verify the result.

For example, here would be the test for deleting a room:

{% highlight ruby %}
c = Tinder::Campfire.new 'mycampfire'
c.login('email', 'pass')
room = c.create_room 'My Test Room'
assert room.destroy
assert !c.find_room_by_name('My Test Room')
{% endhighlight %}

How do I know that it is working? All I'm testing is that `#destroy` returns true and that Tinder thinks that it is gone. Is that good enough? To make matters worse, every other test will depend on at least login with whatever other setup code is required.

Ideally, each API method would be tested by making assertions on the HTTP request/response.

### Graticule

With [Graticule](http://graticule.rubyforge.org), I decided that instead of requiring API keys for every service and hitting up against them with every test (especially since some services are pay-per-request), I would just save sample responses and mock the HTTP connection. This works really well as far as unit testing goes, but poses problems if services change their APIs.

Ideally, what I need is to be able to run the exact same test suite locally and remotely, but I haven't figured out a good way to do the setup.

### What is a wanna-be tester to do?

I could keep talking about examples (LDAP, [CalDAV](http://rubyforge.org/projects/caldav), etc.), but you get the point.

Testing **isn't supposed** to worry about the internals of the code and only test the API, but with something like Tinder, how do you properly test it without peeking into the guts? What are some things you are doing to handle external dependencies?
