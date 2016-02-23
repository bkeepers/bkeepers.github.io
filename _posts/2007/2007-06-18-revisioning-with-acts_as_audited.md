---
layout: post
title: "Revisioning with acts_as_audited"
id: 4cf5b66fdabe9d2c61000395
updated: 2010-11-30T21:43:59-05:00
date: 2007-06-18T14:21:00-04:00
tags:
- code
redirect_from: /blog/archives/2007/06/18/revisioning-with-acts_as_audited/
---

When I first created [acts\_as\_audited](/2006/7/21/acts_as_audited) over a year ago, I intended to add versioning/revisioning capabilities, but found I never really had a need. Well, it just so happened that I finally had a need on an app that we are working on. So, acts\_as\_audited now allows you to revert back to previous revisions.

You can get all the revisions of a model:

{% highlight ruby %}
article.revisions.each |revision|
  puts revision.class   #=> Article
  puts revision.version #=> 7, 6, 5, 4...
end
{% endhighlight %}

or a specific revision:

{% highlight ruby %}
revision = article.revision(5)
puts revision.title     #=> "Old Title"
{% endhighlight %}

or the previous revision. Reverting is as simple as saving a revision:

{% highlight ruby %}
previous = article.revision(:previous)
previous.save           # revert to previous revision
{% endhighlight %}

See the [original post](/2006/7/21/acts_as_audited) for more details about installing and using the plugin.

### How is this different from acts\_as\_versioned?

I've never used acts\_as\_versioned<sup><a href="#acts_as_versioned">1</a></sup> (because I've never had a need to do versioning), but I do know that it has a few annoying limitations: 1) it requires a separate table (and model) for each model that you want to version, and 2) it saves every attribute, even if it's not changed.

acts\_as\_audited already stories all the changes (and only the changes) in one table, so adding versioning was rather trivial. Revisions are created by walking backward through the audits, collecting the changes, and returning an instance of the model.

### Upgrading

To use the versioning support, you must add a version field in the audits table:

{% highlight ruby %}
add_column :audits, :version, :integer, :default => 0
{% endhighlight %}

Note: if you already have audit records, the version field will have to be initialized.

### Feedback

This code is fairly specific to what I needed, so if you're using it, I would love to hear how it is working for you. Suggestions and patches welcome.

<ol class="footnotes">
<li id="acts_as_versioned">
acts\_as\_audited was actually one of the first plugins that I wrote, so I looked at the best code I could find as an example for writing a plugin, which happened to be acts\_as\_versioned. Kudos to technoweenie.

</li>
</ol>
