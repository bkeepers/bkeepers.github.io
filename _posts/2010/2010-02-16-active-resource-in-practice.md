---

title: "Active Resource in practice"
id: 4cf5b653dabe9d2c61000034
updated: 2010-12-01T01:50:46-05:00
date: 2010-02-16T09:36:00-05:00
tags:
- code
redirect_from: /blog/archives/2010/02/16/active-resource-in-practice/
---

I'm working on app to integrate [Pivotal Tracker](http://pivotaltracker.com) and [Harvest](http://getharvest.com). There's a great [ruby wrapper around Harvest's API](http://github.com/aiaio/harvest), but there isn't a decent Ruby wrapper for [Tracker's v3 API](http://www.pivotaltracker.com/help/api?version=v3), so I thought I would just build one as I needed it.

If this app were read only, I would probably use HTTParty and HappyMapper, but since I also want to be able to update timers and stories, [Active Resource](http://api.rubyonrails.org/classes/ActiveResource/Base.htm) seemed like the right tool for the job. Active Resource in theory is great. Active Resource in practice is not so great. I've toyed around with it in the past, but using it for something real I found it…lacking.

Fortunately the Harvest gem had solved a lot of these problems. I write about them here in hopes that they will be useful to you.

### Challenge 1: Headers don't inherit

Pivotal Tracker uses a token for authentication and looks for it in a header called "X-TrackerToken". It would be nice if you could just set this once, and all Active Resource classes would use it. But unfortunately, headers don't inherit.

So the trick is to define a base class for all of your models to inherit from, and in that override how Active Resource treats headers.

{% highlight ruby %}
module PivotalTracker
  class Resource < ActiveResource::Base
    Resource.site = "https://www.pivotaltracker.com/services/v3"

    class << self
      # If headers are not defined in a given subclass, then obtain
      # headers from the superclass.
      def headers
        if defined?(@headers)
          @headers
        elsif superclass != Object && superclass.headers
          superclass.headers
        else
          @headers ||= {}
        end
      end
  end

  class Project < Resource
  end
end

{% endhighlight %}

Now we can set our token once and subclasses will inherit it:

{% highlight ruby %}
PivotalTracker::Resource.headers['X-TrackerToken'] = "mytoken"
projects = PivotalTracker::Project.find(:all)
{% endhighlight %}

### Challenge 2: "Associations"

I find it strange that Active Resource doesn't support associations. Rails has a standard way of defining embedded resources, so you would think that Active Resource would have a standard way of consuming them (I know, I should get off my lazy duff and contribute a patch, but it's so much easier to just complain about it).

So for APIs that have nested resources like Pivotal Tracker's, Active Resource forces you to hard code the parent resource id. If you want to get the iterations for a project, then you have to set the project\_id on the Iteration resource.

{% highlight ruby %}
PROJECT_ID = 1738

module PivotalTracker
  class Iteration < Resource
    self.prefix = "/services/v3/projects/#{PROJECT_ID}"
  end
end
{% endhighlight %}

This is just not a scalable solution. I'm going to need to be able to access multiple projects in the app that I'm working on. So the Harvest gem had a really clever (and evil) solution, which I've modified a bit here.

It basically involves creating an anonymous subclass of our resource, and setting the prefix just for that subclass.

{% highlight ruby %}
module PivotalTracker
  class Project < Resource
    def iterations
      Iteration.build_subclass.tap do |iteration|
        iteration.prefix = "/services/v3/projects/#{self.id}"
      end
    end
  end
end
{% endhighlight %}

Now we can access iterations for any project.

{% highlight ruby %}
iterations = Project.find(x).iterations.find(:all)
{% endhighlight %}

The `#build_subclass` method is [defined on the base resource](http://github.com/collectiveidea/pivotal_tracker/blob/master/lib/pivotal_tracker/resource.rb#L18) and just creates an anonymous subclass and copies some settings that don't inherit.

### Onward Ho!

I don't have a lot built out yet for the new Pivotal Tracker wrapper, but you can check out the [latest progress on GitHub](http://github.com/collectiveidea/pivotal_tracker). I feel like I've overcome most of the bit barriers, so it shouldn't take much to finish it up.

Do you have any other tips or tricks for working with Active Resource?
