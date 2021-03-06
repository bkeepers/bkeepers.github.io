---

title: "acts_as_ferret will_paginate"
id: 4cf5b669dabe9d2c610002cb
updated: 2010-11-30T21:43:53-05:00
date: 2007-08-17T00:21:00-04:00
tags:
- code
redirect_from: /blog/archives/2007/08/17/acts_as_ferret-will_paginate/
---

***Update:** This is not needed with recent versions of acts\_as\_ferret.*

Here's a little nugget to add to [acts\_as\_ferret](http://projects.jkraemer.net/acts_as_ferret/wiki) to make your searches paginate with [will\_paginate](http://errtheblog.com/post/4791).

{% highlight ruby %}
module ActsAsFerret
  module ClassMethods
    def paginate_search(query, options = {})
      page, per_page, total = wp_parse_options(options)
      pager = WillPaginate::Collection.new(page, per_page, total)
      options.merge!(:offset => pager.offset, :limit => per_page)
      result = find_by_contents(query, options)
      returning WillPaginate::Collection.new(page, per_page, result.total_hits) do |pager|
        pager.replace result
      end
    end
  end
end
{% endhighlight %}

<em>Updated from Behrang's comment based on changes to will\_paginate.</em>

There was a slight challenge in that will\_paginate expects that you do one query to get the count, create a new collection object based on that count, and then perform the actual search. But acts\_as\_ferret does it all in one method call, so I have to create a temporary collection object to get the offset, then do the search and create the collection object. It's a little messier than it needs to be, but it works.

{% highlight ruby %}
Product.paginate_search params[:q], :page => params[:page]
{% endhighlight %}
