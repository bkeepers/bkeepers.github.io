---

title: "Round floats to the nearest X"
id: 4cf5b66cdabe9d2c610002f5
updated: 2010-11-30T21:43:56-05:00
date: 2007-07-18T11:37:00-04:00
tags:
- code
redirect_from: /blog/archives/2007/07/18/round-floats-to-the-nearest-x/
---

For those pesky times when whole numbers just won't cut it, but you only want some precision.

{% highlight ruby %}
7.7.round(0.5)   #=> 7.5
7.95.round(0.5)  #=> 8
8.2.round(1.5)   #=> 7.5
8.3.round(1.5)   #=> 9
{% endhighlight %}

The magic, courtesy of [Daniel Morrison](http://daniel.collectiveidea.com/blog):

{% highlight ruby %}
class Float
  def round(round_to = 1.0)
    mod = self % round_to
    rounded = self - mod + (mod >= round_to/2.0 ? round_to : 0)
    rounded % 1 == 0 ? rounded.to_i : rounded
  end
end
{% endhighlight %}

Note that do to some quirks with Ruby's handling of floats, you won't get what you expect in some situations:

{% highlight ruby %}
3.5.round(0.2)   #=> 3.4, instead of 3.6
{% endhighlight %}
