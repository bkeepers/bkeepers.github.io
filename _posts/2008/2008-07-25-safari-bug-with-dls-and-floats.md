---

title: "Safari bug with DLs and floats"
id: 4cf5b65fdabe9d2c61000183
updated: 2010-11-30T21:43:43-05:00
date: 2008-07-25T10:35:00-04:00
tags:
- code
redirect_from: /blog/archives/2008/07/25/safari-bug-with-dls-and-floats/
---

I came across a weird Safari bug today and couldn't find any other mention of it on the interwebs. Here's the CSS and HTML to reproduce it:

{% highlight css %}
dt {
  width: 200px;
  float: left;
}
dd {
  margin: 0 0 0 200px;
}
dd p {
  float: left;
}
{% endhighlight %}

{% highlight html %}
<dl>
  <dt>term</dt>
  <dd>
      <p>p1</p>
      <p>p2</p>
      <p>p3</p>
  </dd>
</dl>
{% endhighlight %}

<!-- Image not found: /assets/2008/7/25/with_float_1.jpg -->
What's happening is that safari is adding a right margin to the `dd`, even though it is explicitly set to 0. Removing either the `float: left` from the `dt`, or `position: overflow` from the `dd` (which is used to clear the floats) makes the right margin go away. Very odd.

<!-- Image not found: /assets/2008/7/25/without_float.jpg -->
My ultimate solution was just to add a `div` inside the `dd` that set `overflow:hidden` to clear the floats.

<!-- Image not found: /assets/2008/7/25/solution_1.jpg -->
