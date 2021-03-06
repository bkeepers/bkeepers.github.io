---

title: "Ruby Documentation"
id: 4cf5b683dabe9d2c61000700
updated: 2010-11-30T21:44:19-05:00
date: 2006-07-03T06:48:00-04:00
tags:
- code
redirect_from: /blog/archives/2006/07/03/ruby-documentation/
---

<p>
One of my (few) frustrations transitioning from Java to Ruby has been accessibility of library documentation. The only thing I miss about Java and a statically typed language is that almost all the documentation you need is available through the IDE. There is almost no uncertainty about what methods are available, what a method returns or what parameters it takes. There are other means to get to this information in Ruby, but I haven't been able to find a central, easily accessible source for documentation.

</p>
<p>
HTML output of RDoc is good; I can open up <a href="http://ruby-doc.org">ruby-doc.org</a> and <a href="http://api.rubyonrails.org">api.rubyonrails.org</a> in a browser, but that only addresses part of the problem. How do I know what methods are available on a String in Rails, without having to wade through the Rails HTML RDoc for the 5 extensions to the String class? IRB (or <code>script/console</code>) helps by allowing me just to do <code>"".methods.sort</code>, but that's by no means accessible, and if I want more information on a method, there's no way to link to it.

</p>
<p>
The other problem that I have consistently wrestled with is documentation for gems. This is probably old-hat to many Rubyists, but I just discovered <code>gem\_server</code>, which helps immensely. <code>gem\_server</code> starts up WebBrick on port 8808 and provides HTML RDoc for all the gems you have installed.

</p>
<p>
Since having all this available in an editor is probably a pipe dream (TextMate is good, but it's not that good), what are my options? Maybe this would be a good candidate for a Rails plugin that would expose a controller with searchable documentation for the current app, using some Ruby magic to merge all the documentation together.

</p>
<p>
<b>update:</b> I've posted some more thoughts on this subject in <a href="/2006/07/04/ruby-documentation-redux/">Ruby Documentation Redux</a>.

</p>
