---

title: "Proxy support for Tinder"
id: 4cf5b661dabe9d2c610001e6
updated: 2010-11-30T21:43:45-05:00
date: 2008-04-18T04:30:00-04:00
tags:
- code
redirect_from: /blog/archives/2008/04/18/proxy-support-for-tinder/
---

I got to feel the pain of being stuck behind an HTTP proxy this week while working at Xerox's office in El Segundo, CA. It sucked. You don't realize how much you use the internet until you can't get to half of the sites that you use every day.

So, in an effort to sympathize with other poor souls that are stuck behind a proxy during the work day, I [added proxy support](http://github.com/collectiveidea/tinder/commit/e99e0b698de2a66e7e7c08f9e4c9b8ffe83eacc8) to [Tinder](http://tinder.rubyforge.org):

{% highlight ruby %}
  c = Tinder.new('subdomain', :proxy => 'http://user:pass@proxy.example.com:8000')
{% endhighlight %}

I don't actually have access to testing this, so I'd appreciate if someone behind a proxy could check out the code from [git](http://github.com/collectiveidea/tinder) and confirm that it works, and then I will put out a new release.

Speaking of git, I'm now only pushing changes to git. The [subversion repository](http://source.collectiveidea.com/public/tinder/trunk) will stay around but will not be kept up to date.
