---

title: "Using shared indexes with acts_as_ferret"
id: 4cf5b661dabe9d2c610001d8
updated: 2010-11-30T21:43:45-05:00
date: 2008-04-28T20:00:00-04:00
tags:
- code
redirect_from: /blog/archives/2008/04/28/using-shared-indexes-with-acts_as_ferret/
---

So by now we all know how to do wicked-cool search with [acts\_as\_ferret](http://projects.jkraemer.net/acts_as_ferret/). (If not, the [RailsEnvy guys can lend a hand](http://www.railsenvy.com/2007/2/19/acts-as-ferret-tutorial), but the tutorial is a little outdated for the latest trunk version of acts\_as\_ferret. Just replace `#find_by_contents` with `#find_with_ferret` and you should be good.)

But searching a single model is *so* last year. All the cool kids are getting promiscuous with their searches and involving multiple models. Fortunately for us, recent revisions of `acts_as_ferret` makes this easy-peasy.

The key to making this happen is a shared index: we want all of our models indexed in one place so ferret only has to do one search. We can do it without a shared index, but then we have to do a ferret search and thus a SQL select for each model. Plus, if we want your search results interspersed and sorted by rank, we have to have a shared index.

### Enough chit-chat, show us how!

Ok, I'm getting to it. Grab the latest version of acts as ferret from trunk:

script/plugin install svn://projects.jkraemer.net/acts\_as\_ferret/trunk/plugin/acts\_as\_ferret

Now, instead of defining `acts_as_ferret` in our models, we define them all in `config/aaf.rb`

{% highlight ruby %}
ActsAsFerret::define_index('shared',
 :models => {
   Person  => {:fields => [:first_name, :last_name, :phone, :bio]},
   Company => {:fields => [:name, :description]},
   Post    => {:fields => [:title, :body]}
 },
 :ferret   => {
   :default_fields => [:first_name, :last_name, :phone, :bio, :name, :description, :title, :body]
 }
)
{% endhighlight %}

This defines a new index, called "shared", and then defines the `acts_as_ferret` configuration for each model.

Now for the fun part: searching our shiny new index.

{% highlight ruby %}
def search
  @results = ActsAsFerret.find(params[:q], 'shared')
end
{% endhighlight %}

This will give us one array with any models that matched the search query, ordered by rank. And for those times when we only want to search one model, we can still do that.

{% highlight ruby %}
def search
  @people = Person.find_with_ferret(params[:q])
end
{% endhighlight %}

### How do we display the results?

**Update**: Sorry, originally I had an example using resources, but that doesn't work as-is; I was doing something a little different in the app that this example came from.

To display our search results, we just render a partial for each model in the result:

{% highlight erb %}
<% @results.each do |result| %>
  <%= render :partial => "search/#{dom_class(result)}" %>
<% end %>
{% endhighlight %}

This will just look for a partial for each model (like `search/_person.html.erb`).

So there you have it. Now you too can have promiscuous searching.

**Update**: I've put together an [example rails app](http://opensoul.org/assets/2008/5/12/ferret-example_1.zip) that uses the shared index. It uses sqlite and has some date pre-populated. Start up `script/server` and do a search for "John".
