---

title: "Tip: Overriding link_to to accept a block"
id: 4cf5b681dabe9d2c610005ed
updated: 2010-11-30T21:44:17-05:00
date: 2006-08-04T12:10:00-04:00
tags:
- code
redirect_from: /blog/archives/2006/08/04/tip-overriding-link_to-to-accept-a-block/
---

<p>
You'd think I would get tired of saying this: Ruby is amazing! On numerous occasions in recent weeks, I've needed some complex logic or multiple lines worth of code to determine the title for my <code>link\_to</code> calls. For example:

</p>
{% highlight erb %}
&lt;%= link_to(course.full? ?
    "&lt;span class="full"&gt;#{course.name}&lt;/span&gt;" :
    course.name + course.almost_full? ?
        "&lt;span class=\"available\"&gt;" +
            "(#{pluralize course.capacity, 'spot'} available)&lt;/span&gt;" :
        "&lt;span class=\"enrolled\"&gt;" +
            "(#{pluralize course.enrolled.count, 'student'} enrolled)&lt;/span&gt;",
    :action =&gt; 'show', :id =&gt; course)

%&gt;
{% endhighlight %}

<p>
The output of this would be something like:

</p>
{% highlight html %}
&lt;a href="/courses/show/1"&gt;&lt;span class="full"&gt;Cognitive Ergonomics&lt;/span&gt;&lt;/a&gt;
{% endhighlight %}

<p>
or

</p>
{% highlight html %}
&lt;a href="/courses/show/1"&gt;Cognitive Ergonomics &lt;span class="enrolled"&gt;(3 students enrolled&lt;/span&gt;)&lt;/a&gt;
{% endhighlight %}

<p>
or

</p>
{% highlight html %}
&lt;a href="/courses/show/1"&gt;Cognitive Ergonomics &lt;span class="available"&gt;(3 spots available&lt;/span&gt;)&lt;/a&gt;
{% endhighlight %}

<p>
...depending on the conditions.

</p>
<p>
Now, one could argue that I should just break it out into a bunch of if/else branches, and call <code>link\_to</code> for each one, but...this is Ruby, there's got to be a way to keep it <acronym title="Don't Repeat Yourself">DRY</acronym>! Especially if my <code>link\_to</code> arguments are lengthy, which is often the case with <code>link\_to\_remote</code>.

</p>
<p>
The solution I came up with today involves adding the following to one of your view helpers, like <code>ApplicationHelper</code>:

</p>
{% highlight ruby %}
def link_to(*args, &amp;block)
  if block_given?
    concat super(capture(&amp;block), *args), block.binding
  else
    super(*args)
  end
end
{% endhighlight %}

<p>
As <a href="http://codefluency.com/">Bruce Williams</a> pointed out to me, due to the way modules are mixed in, calling <code>super</code> on an overridden method will end up calling the original class method. So, if a block is passed, it will capture the result of the block and pass it on as the first argument along with the other arguments to the original link\_to method. If no block is given, it will simply pass on all the arguments to the original link\_to method

</p>
<p>
The result is that now I can continue to use <code>link\_to</code> in the traditional fashion, or for those tricky situations, just pass a block to it, like:

</p>
{% highlight erb %}
&lt;% link_to(:action =&gt; 'show', :id =&gt; course) do %&gt;
    &lt;% if course.full? -%&gt;
        &lt;span class="full"&gt;&lt;%= course.name %&gt;&lt;/span&gt;
    &lt;% else -%&gt;
        &lt;%= course.name %&gt;
        &lt;% if course.almost_full? %&gt;
            &lt;span class="available"&gt;
                (&lt;%= pluralize course.capacity, 'spot' %&gt; available)
            &lt;/span&gt;
        &lt;% else %&gt;
            &lt;span class="enrolled"&gt;
                (&lt;%= pluralize course.enrolled.count, 'student' %&gt; enrolled)
            &lt;/span&gt;
        &lt;% end %&gt;
    &lt;% end -%&gt;
&lt;% end %&gt;
{% endhighlight %}

<p>
Now I can do all the branching that I want with if/else statements, and I only have to declare my link\_to parameters once

</p>
<p>
If only I could figure out how to alias this method in the helper, it could work with all the variations of the link\_to helpers (well, technically, any helper that you want to pass a block in as the first argument). Calling <code>alias\_method :link\_to\_remote, :link\_to</code> doesn't work, and <code>define\_method</code> doesn't seem to let me get the block. Anyone have any ideas?

</p>
