---

title: "Tinder: reading Campfire transcripts"
id: 4cf5b675dabe9d2c61000454
updated: 2010-11-30T21:44:05-05:00
date: 2007-03-04T22:34:00-05:00
tags:
- code
redirect_from: /blog/archives/2007/03/04/tinder-reading-campfire-transcripts/
---

I've committed a first pass at transcript support for [Tinder](/2006/12/8/tinder-campfire-api). I don't really have an immediate need for it, so I'd love to get some feedback on how useful it is, and if there's other transcript features that are missing.

{% highlight ruby %}
dates = room.available_transcripts
transcript = room.transcript(dates.first)
transcript.first
#=> {:message=>"foobar!", :user_id=>"99999", :person=>"Brandon", :id=>"18659245"}
{% endhighlight %}

[Check out the source](http://github.com/collectiveidea/tinder) and let me know what you think.
