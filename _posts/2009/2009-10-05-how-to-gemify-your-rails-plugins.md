---

title: "How to Gemify your Rails Plugins"
id: 4cf5b653dabe9d2c61000057
updated: 2010-12-01T02:06:48-05:00
date: 2009-10-05T13:33:00-04:00
tags:
redirect_from: /blog/archives/2009/10/05/how-to-gemify-your-rails-plugins/
---

Ever since [Rails added support for declaring gem dependencies](http://ryandaigle.com/articles/2008/4/1/what-s-new-in-edge-rails-gem-dependencies), there is really no (good) reason to use plain ol' plugins. We've been slowly gemifying [all of our plugins](http://github.com/collectiveidea) as we need them. There's a few hoops you have to jump through to get Rake tasks and Capistrano recipes working, but it's fairly straight forward.

First, you need something that will help you generate the gemspec and build the gem. You can do this by hand, but there's several great plugins out there that make it easy. We recommend [Jeweler](http://github.com/technicalpickles/jeweler). Follow the directions in the Jeweler README for "Using in an existing project".

### 1. Move `init.rb` to `rails/init.rb`

Rails plugins have the magical `init.rb` that gets loaded when the plugin is initialized. To make this work in a gem, all you have to do is move it to `rails/init.rb`. Recent versions of Rails will look there whether you install it as a plugin or a gem, so you can just move it to the new location if you don't care about ancient versions of Rails.

### 2. Move rake tasks to `lib/`

Rails will load `tasks/*.rake` defined in any plugins. Unfortunately, these don't get loaded from Gems. To make your rake tasks work from a plugin, you will need to move them into the lib directory, and explicitly require them from your app's `Rakefile`:

{% highlight ruby %}
require 'mygem/tasks'
{% endhighlight %}

If you want your tasks to still be available when your code is installed as a plugin, you can just explicitly require the task from `task/mygem.rake`:

{% highlight ruby %}
require File.expand_path(File.join(File.dirname(__FILE__), '..', 'lib', 'mygem', 'tasks'))
{% endhighlight %}

### 3. Move Capistrano tasks to `lib/`

Capistrano recipes defined at `recipes/*.rb` in your plugin are also automatically loaded by Rails. Unfortunately, they suffer the same fate as Rake tasks and have to be move to the lib directory and be explicitly required from `config/deploy.rb`.

When moving the recipes to the lib directory, we have to jump through a hoop to get Capistrano to load it properly.

{% highlight ruby %}
Capistrano::Configuration.instance.load do
  # put cap recipes here
end
{% endhighlight %}

And in your `config/deploy.rb`:

{% highlight ruby %}
require 'mygem/recipes'
{% endhighlight %}

As with Rake tasks, if you want your recipes to still work when installed as a plugin, add the following to a file in the `recipes/` directory of your plugin:

{% highlight ruby %}
require File.expand_path(File.join(File.dirname(__FILE__), '..', 'lib', 'mygem', 'recipes'))
{% endhighlight %}

### 4. Generators

You don't have to do anything, they just work.

### That's it

Publish your gem and go buy yourself a drink. Check out [one](http://github.com/collectiveidea/awesome_nested_set) of [our](http://github.com/collectiveidea/delayed_job) [gems](http://github.com/collectiveidea/deploy_and_deliver) if you need [more](http://github.com/collectiveidea/acts_as_audited) [examples](http://github.com/collectiveidea/no-peeping-toms).
