---

title: "Merging Active Record models"
id: 4cf5b65cdabe9d2c6100015a
updated: 2010-11-30T21:43:40-05:00
date: 2008-08-21T05:00:00-04:00
tags:
- code
redirect_from: /blog/archives/2008/08/21/merging-active-record-models/
---

<div class="banner">
<!-- Image not found: /assets/2008/8/21/merge.jpg -->
</div>
We've been working on a project that involves importing a massive amount of data from multiple sources. The data is somewhat complicated, so we occasionally end up with duplicate records that need merged together. The data is highly normalized, so there are a bunch of associations that also need merged. If you've ever done this by hand, you know how painful it can be.

To alleviate that pain, I introduce you to [merger](http://github.com/collectiveidea/merger), a Rails plugin for merging Active Record models.

{% highlight ruby %}
@person.merge!(Person.find_all_by_email(@person.email))
{% endhighlight %}

The plugin is pretty simple right now. All it does is:

1.  Given a set of records, picks the oldest record (the one with the lowest id) as the one to keep
2.  Moves any associated `has_many` and `habtm` records from the duplicates to the record that is being kept
3.  Deletes the duplicate records

We intend to add a lot to it, including:

-   Strategies for choosing which record to keep
-   Strategies for merging the individual attributes of the records
-   Recursively merge associations based on certain attributes
-   Options for what to do with the duplicate records

[Check it out on Github](http://github.com/collectiveidea/merger) and let us know what you think.

<ol class="footnotes">
<li>
Photo adapted from <a href="http://flickr.com/photos/xrrr/2478140383/">http://flickr.com/photos/xrrr/2478140383/</a>

</li>
</ol>
