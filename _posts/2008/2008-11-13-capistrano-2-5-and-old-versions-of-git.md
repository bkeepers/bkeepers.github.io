---

title: "Capistrano 2.5 and older versions of git"
id: 4cf5b659dabe9d2c61000105
updated: 2010-11-30T21:43:37-05:00
date: 2008-11-13T11:43:00-05:00
tags:
- code
redirect_from: /blog/archives/2008/11/13/capistrano-2-5-and-old-versions-of-git/
---

Git support in [Capistrano](http://capify.org) 2.5 got a little lovin', but as a result, it may have broke your deploys. By default, Capistrano now uses the `-q` flag to tell git to not be so chatty. But older versions of git (1.4.x and maybe some early 1.5.x versions) don't support the `-q` flag. If upgrading git isn't an option, the solution is simple. Just tell Capistrano to take the muzzle off of git:

{% highlight ruby %}
set :scm_verbose, true
{% endhighlight %}
