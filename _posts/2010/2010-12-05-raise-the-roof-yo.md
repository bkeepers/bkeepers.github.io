---

title: "Raise the roof, yo!"
id: 4cfafdacdabe9d4a1d0000b7
updated: 2010-12-05T23:05:09-05:00
date: 2010-12-05T23:02:00-05:00
tags:
- code
redirect_from: /blog/archives/2010/12/05/raise-the-roof-yo/
---

Check out this awesome abuse of Ruby syntax from [Don Petersen](https://gist.github.com/322146):

{% highlight ruby %}
module Kernel
  def the(a, b)
    a.new(b)
  end

  def roof
    Exception
  end

  def yo!
    "Get your hands in the air, wave them like..."
  end
end

raise the roof, yo!
# Exception: Get your hands in the air, wave them like...
{% endhighlight %}
