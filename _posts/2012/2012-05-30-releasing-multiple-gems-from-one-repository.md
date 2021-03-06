---

title: "Releasing multiple gems from one repository"
id: 4fc642b0dabe9d295c000e1c
updated: 2012-05-30T14:41:13-04:00
date: 2012-05-30T11:00:00-04:00
tags:
- code
redirect_from: /blog/archives/2012/05/30/releasing-multiple-gems-from-one-repository/
---

When I released [qu](https://github.com/bkeepers/qu), I wanted to split the various backends and exception handlers into multiple gems so each gem had the proper dependencies without enforcing all of the dependencies on everyone all the time.

I had to decide between maintaining multiple repositories for each plugin, or releasing them all from the same repository. There are advantages and disadvantages to both, but I decided I would rather start with them in one repository and split them out later if it became a problem.

Several people have asked how I did it. Here's my secret formula.

Plugin gemspec
--------------

For each gem we want to release, we need a gemspec. For example, check out [`qu-redis.gemspec`](https://github.com/bkeepers/qu/blob/master/qu-redis.gemspec). Most of the gemspec is standard, but there are a few things I want to draw to your attention.

Since we'll be releasing multiple gems out of this directory, we need to make sure we get the right files for this gem. You can use whatever criteria makes sense for your project, but for `qu-redis` it worked out to just grab any file that has "redis" in the name.

{% highlight ruby %}
s.files = `git ls-files -- lib | grep redis`.split("\n")
{% endhighlight %}

We need to make sure that this plugin then depends on a compatible version of the main library. For Qu, I lock each plugin to the exact version. When I release a bugfix, I release a new version of each gem, whether it is changed or not.

{% highlight ruby %}
s.add_dependency 'qu', Qu::VERSION
{% endhighlight %}

Each plugin can and should declare any other dependencies.

{% highlight ruby %}
s.add_dependency 'redis-namespace'
s.add_dependency 'simple_uuid'
{% endhighlight %}

Now we have a gem for our plugin, with its own files and dependencies.

Main gemspec
------------

The gemspec for our "core" library will look a little different. Check out [`qu.gemspec`](https://github.com/bkeepers/qu/blob/master/qu.gemspec) for the full version. We want to avoid including files from other gems in our project, so first we get a list of those files.

{% highlight ruby %}
plugin_files = Dir['qu-*.gemspec'].map { |gemspec|
  eval(File.read(gemspec)).files
}.flatten.uniq
{% endhighlight %}

We get a list of the files for the gem, and then exclude files from our other gems.

{% highlight ruby %}
s.files = `git ls-files`.split("\n") - plugin_files
{% endhighlight %}

Gemfile
-------

If you're using bundler for your development dependencies (which you should be), then you probably want to lock the dependencies from your gemspecs without having to redeclare them. We can easily tell bundler about all of our gemspecs.

{% highlight ruby %}
source :rubygems

gemspec :name => 'qu'

Dir['qu-*.gemspec'].each do |gemspec|
  plugin = gemspec.scan(/qu-(.*)\.gemspec/).flatten.first
  gemspec(:name => "qu-#{plugin}", :development_group => plugin)
end
{% endhighlight %}

Rakefile
--------

Lastly, we want to automate the build process by adding `build` and `release` rake tasks.

{% highlight ruby %}
desc 'Build gem into the pkg directory'
task :build do
  FileUtils.rm_rf('pkg')
  Dir['*.gemspec'].each do |gemspec|
    system "gem build #{gemspec}"
  end
  FileUtils.mkdir_p('pkg')
  FileUtils.mv(Dir['*.gem'], 'pkg')
end

desc 'Tags version, pushes to remote, and pushes gem'
task :release => :build do
  sh 'git', 'tag', '-m', changelog, "v#{Qu::VERSION}"
  sh "git push origin master"
  sh "git push origin v#{Qu::VERSION}"
  sh "ls pkg/*.gem | xargs -n 1 gem push"
end
{% endhighlight %}

Profit
------

This has worked out really well so far. All the activity for the project is in one repo, and pushing out a new release is really easy. Win, win!
