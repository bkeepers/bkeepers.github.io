---
layout: post
title: "Renaming .rhtml to .erb using Ruby"
id: 4cf5b676dabe9d2c6100045f
updated: 2010-11-30T21:44:06-05:00
date: 2007-03-04T00:51:00-05:00
tags:
- code
redirect_from: /blog/archives/2007/03/04/renaming-rhtml-to-erb-using-ruby/
---

Even though Rails isn't [dropping support for <code>.rhtml</code> in favor of <code>.erb</code>](http://dev.rubyonrails.org/changeset/6178) for a while, it doesn't hurt to switch now (if you're using edge Rails).

After a brief, thoughtless, moment of typing <code>svn mv file.rhtml file.erb</code> a couple of times, it donned on me that I'm not a monkey.

{% highlight ruby %}
Dir.glob('app/views/**/*.rhtml').each do |file|
  puts `svn mv #{file} #{file.gsub(/\.rhtml$/, '.erb')}`
end
{% endhighlight %}
