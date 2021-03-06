---

title: "Tinder: Campfire API"
id: 4cf5b67cdabe9d2c6100051b
updated: 2010-12-01T02:34:31-05:00
date: 2006-12-08T01:02:00-05:00
tags:
- popular
- code
redirect_from: /blog/archives/2006/12/08/tinder-campfire-api/
---

**update**: [Tinder can listen](/2007/1/27/tinder-listening-is-just-as-important-as-speaking)

**update**: Tinder is now available as a gem from rubyforge. Check out <http://rubyforge.org/projects/tinder> for more information.

For a project that I'm currently working, the client wants to be able provide live chat to its users. So, instead of re-inventing the wheel, we decided to try to use [Campfire](http://campfirenow.com). The only problem is that I need to be able to create and destroy chat rooms automatically, and Campfire doesn't have an API.

[Caboo.se](http://caboo.se) has done some work on a [Campfire bot called Marshmallow](http://www.caboo.se/articles/2006/04/14/meet-marshmallow-the-campfire-bot) but the code repository is unavailable. And, it doesn't seem to allow you to create and delete rooms.

So, introducing Tinder, an API for interfacing with Campfire:

{% highlight ruby %}
require 'rubygems'
require 'tinder'
campfire = Tinder::Campfire.new 'mysubdomain'
campfire.login 'myemail@example.com', 'mypassword'
room = campfire.create_room 'New Room', 'My new campfire room to test tinder'
room.speak 'Hello world!'
room.paste File.read("path/to/your/file.txt")
room.destroy
{% endhighlight %}

### Install

    gem install tinder

You can get the source from:

    git clone git://github.com/collectiveidea/tinder.git

Tinder can also be installed as a gem or a rails plugin.

    script/plugin install git://github.com/collectiveidea/tinder.git

Thanks to [Zach Dennis](http://continuousthinking.com) for the name. Feedback and patches are welcome!

<p style="text-align:center; font-size: 0.8em;">
<img src="/assets/2006/12/8/tinder.gif" alt="Tinder" /><br/>
image courtesy of [Tutorials.com](http://www.tutorials.com/04/0438/04383.asp)

</p>
