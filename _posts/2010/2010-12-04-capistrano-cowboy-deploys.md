---

title: "Capistrano cowboy deploys"
id: 4cfafc1bdabe9d3fcb000265
updated: 2010-12-04T21:44:52-05:00
date: 2010-12-04T21:42:00-05:00
tags:
- code
redirect_from: /blog/archives/2010/12/04/capistrano-cowboy-deploys/
---

Sometimes, you just need to shoot from the hip…or deploy your local changes without committing them. Put this snippet from [Jesse Newland](http://gist.github.com/542617) in `~/.caprc` and now you can `cap cowboy deploy`:

{% highlight ruby %}
namespace :cowboy do
  desc 'Deploy without SCM'
  task :default do
    set :repository,  "."
    set :deploy_via, :copy
    set :scm, :none
    set :stage, fetch(:stage, 'none')
    set :cowboy_deploy, true
    set :copy_exclude, [".git/*", ".svn/*", "log/*", "vendor/bundle/*"]
  end
end
{% endhighlight %}
