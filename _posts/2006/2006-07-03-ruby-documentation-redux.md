---

title: "Ruby Documentation Redux"
id: 4cf5b683dabe9d2c610006fc
updated: 2010-11-30T21:44:19-05:00
date: 2006-07-03T20:16:00-04:00
tags:
- code
redirect_from:
- /blog/archives/2006/07/03/ruby-documentation-redux/
- /blog/archives/2006/07/04/ruby-documentation-redux/
---

<p>
Apparently, in my attempt to help eliminate comment spam, I managed to disable comments from users that are not logged in (which, doesn't work too well when I have registration disabled). I received a few responses to my <a href="/2006/07/03/ruby-documentation/" title="Ruby Documentation">previous post</a> via email, so I thought I would mention them and expand upon my frustrations with Ruby documentation.

</p>
<p>
Aníbal Rojas emailed me to point out <a href="http://www.rubymanual.org">rubymanual.org</a>. This looks like a pretty good site, but seems to still suffer from the shortcoming of only having the core Ruby documentation and not the extensions from Rails or any other gems.

</p>
<p>
David Felstead emailed me to point out the <a href="http://widgets.precisionis.com.au/">Ruby RDoc Dashboard widget</a>. This is a handy little widget, but still isn't a solution that I like. One shortcoming I think it has (correct me if I'm wrong) is that it appears to use the RDoc from the internet, and not the local machine. I'll explain more of why this is a problem for me in a minute.

</p>
<p>
For a while I was using <code>ri</code> from the command line, and one thing I liked about that is that I could easily import documentation by running <code>rdoc --ri /path/to/src/lib</code>. So I ran that on most of the gems I used frequently, including Rails. What I didn't like about <code>ri</code> is that I couldn't easily jump around the documentation. I could look up <code>ri ClassName</code> to find the method in the class that I was looking for, but then to get more info about that method, I had to exit, and type <code>ri ClassName\#method</code>. The other problem is that it would occasionally generate exceptions, especially in cases where a library or class would redefine a method. I never took the time to debug it, but usually deleting the <code>.rdoc</code> directory in my home directory, and re-running <code>rdoc --ri</code> fixed it (yes, the Windows equivalent of a reboot).

</p>
<p>
Before I switched to TextMate, I used the <a href="http://rubyeclipse.sourceforge.net/">Ruby Development Tools</a> plugin for Eclipse, and one thing I really liked about that was the built in RI browser. I could search through all the RI docs and easily find the methods I was looking for. This is what I wished the Dashboard widget allowed me to do. The down side is that using <code>ri</code> on the back-end causes the problem with exceptions that I described above, and it was really slow on the Mac (didn't seem to have that problem when I was running Linux though).

</p>
<p>
So, here's my wish-list for a documentation system in Ruby, in order of importance:

</p>
<ul>
<li>
merge core Ruby docs with installed gems and other libraries&mdash;including redefined or added methods, which would probably require some type of environment awareness (not a problem for Rails apps)

</li>
<li>
linked cross-references

</li>
<li>
searchable

</li>
<li>
fast

</li>
</ul>
