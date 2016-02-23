---
layout: post
title: "Tinder: Chatting in private"
id: 4cf5b677dabe9d2c61000497
updated: 2010-11-30T21:44:07-05:00
date: 2007-02-12T19:08:00-05:00
tags:
- code
redirect_from: /blog/archives/2007/02/12/tinder-chatting-in-private/
---

Thanks Tero Parviainen, [Tinder](/2006/12/8/tinder-campfire-api) now has SSL support.

{% highlight ruby %}
campfire = Tinder::Campfire.new("mydomain", :ssl => true)
campfire.login email, password
campfire.ssl?
#=> true
{% endhighlight %}

Now you can chat in private.
