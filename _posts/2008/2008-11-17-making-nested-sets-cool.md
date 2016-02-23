---
layout: post
title: "awesome_nested_set: making nested sets cool"
id: 4cf5b659dabe9d2c610000ff
updated: 2010-12-01T02:38:06-05:00
date: 2008-11-17T01:32:00-05:00
tags:
- popular
- code
redirect_from: /blog/archives/2008/11/17/making-nested-sets-cool/
---

Yes, I'm making the assertion that preordered [tree traversal](http://en.wikipedia.org/wiki/Tree_traversal) is now cool. And I don't mean just "pocket protector" cool, because it's always been that, but now it's "show your friends" cool.

For those that have no idea what I'm talking about, and don't really care, but still want to be cool, skip to the next section. For all three of you that want to understand all the gory details, check out this [MySQL DevZone article on managing hierarchical data](http://dev.mysql.com/tech-resources/articles/hierarchical-data.html).

### What are you talking about?

I'm talking about putting hierarchical data into a relational database, and a plugin to make that easier. There are lots of reasons for trying to do this: organizational structures, genealogies, [taxonomies](http://en.wikipedia.org/wiki/Taxonomy), nested pages of a website, etc. It's kinda like putting a square peg into a round hole, except that the square peg is made out of [Play-Doh](http://weblog.jamisbuck.org/2008/11/9/legos-play-doh-and-programming), so we can force it through the hole anyway, and we just have a little extra mess to deal with.

There were several Active Record plugins out there that tried to clean up the mess, but they were either buggy or incomplete.

We created [awesome\_nested\_set](http://github.com/collectiveidea/awesome_nested_set) to try to remedy that.

### What makes this so awesome?

There's a lot of things that makes this awesome, but my personal favorite is that awesome\_nested\_set makes use of Rails 2.1's named\_scope features^[1](#named_scope_backport^), so most of the nested set methods return a scope that works as a finder. You can call find methods on it or access other named scopes.

{% highlight ruby %}
class Department < ActiveRecord::Base
  acts_as_nested_set
  named_scope :in_need_of_review, :lambda => {
    {:conditions => {:reviewed_at > 1.year.ago}
  }
end

chancellor = Department.create(:name => 'Chancellor')
aa = Department.create(:name => 'Academic Affairs').move_to_child_of(chancellor)
Department.create(:name => 'Admissions').move_to_child_of aa
Department.create(:name => 'Student Services',
  :reviewed_at => 3.months.ago).move_to_child_of aa

chancellor.descendants.in_need_of_review
rogue = chancellor.descendants.all(:conditions => 'manager_id IS NULL')
{% endhighlight %}

There's lots more info in the [README on GitHub](http://github.com/collectiveidea/awesome_nested_set), so check it out. Let us know if you have any suggestions or feedback.

<ol class="footnotes">
<li id="named_scope_backport">
It also backports named\_scope for those still on Rails 2.0

</li>
</ol>
