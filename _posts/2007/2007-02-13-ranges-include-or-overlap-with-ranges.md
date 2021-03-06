---

title: "Ranges include? or overlap? with Ranges"
id: 4cf5b677dabe9d2c61000480
updated: 2010-11-30T21:44:07-05:00
date: 2007-02-13T18:01:00-05:00
tags:
- code
redirect_from: /blog/archives/2007/02/13/ranges-include-or-overlap-with-ranges/
---

**Update**: This has been [added to Rails' active\_support](http://dev.rubyonrails.org/changeset/7800).

The past several days I've found myself repeatedly writing the following lines to check if two events are conflicting:

{% highlight ruby %}
window = course.begin_at...course.end_at
window.include?(event.begin_at) || window.include?(event.end_at?)
{% endhighlight %}

It finally donned on me that all I'm really doing is checking if two ranges overlap. What I really wanted to be doing is:

{% highlight ruby %}
  (course.begin_at...course.end_at).overlap?(event.begin_at...event.end_at)
{% endhighlight %}

While I was at it, I decided that it only made sense that <code>Range\#include?</code> should be able to take a range:

{% highlight ruby %}
class Range

  def overlap?(range)
    self.include?(range.first) || range.include?(self.first)
  end

  def include_with_range?(value)
    if value.is_a?(Range)
      last = value.exclude_end? ? value.last - 1 : value.last
      self.include?(value.first) && self.include?(last)
    else
      include_without_range?(value)
    end
  end
  alias_method_chain :include?, :range

end
{% endhighlight %}

**update**: thanks to Daniel Schierbeck for the better implementation of <code>overlap?</code>

So now, I can do things like:

{% highlight ruby %}
(1..5).include?(2..3)    #=> true
(1..5).include?(4..8)    #=> false
(1..5).overlap?(4..8)    #=> true
(1...5).overlap?(5..10)  #=> false
{% endhighlight %}

I love this language!
