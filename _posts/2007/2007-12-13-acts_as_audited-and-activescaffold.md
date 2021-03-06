---

title: "acts_as_audited and ActiveScaffold"
id: 4cf5b666dabe9d2c61000243
updated: 2010-11-30T21:43:50-05:00
date: 2007-12-13T18:30:00-05:00
tags:
- code
redirect_from: /blog/archives/2007/12/13/acts_as_audited-and-activescaffold/
---

Several people have reported that acts\_as\_audited does not work with ActiveScaffold. I don't use ActiveScaffold, so I had no motivation to fix it. But thanks to a tip from [Aaron](/2006/7/21/acts_as_audited#comment-4569), this has now been fixed.

To make acts\_as\_audited work with ActiveScaffold, only enable auditing for only the `:create`, `:update`, and `:destroy` actions.

{% highlight ruby %}
class ApplicationController < ActionController::Base
  audit User, Thing, :only => [:create, :update, :destroy]
end
{% endhighlight %}

I'm not sure exactly why it breaks or why this fixes it, but from [this thread](http://groups.google.com/group/activescaffold/browse_thread/thread/a717fa3c8b7433a6) it sounds like ActiveScaffold just doesn't support polymorphic associations, which is what acts\_as\_audited uses to associated audits with models.
