---

title: "Autotest mapping for Rails test conventions"
id: 4cf5b65cdabe9d2c61000154
updated: 2010-11-30T21:43:40-05:00
date: 2008-08-22T07:00:00-04:00
tags:
- code
redirect_from: /blog/archives/2008/08/22/autotest-mapping-for-rails-test-conventions/
---

A while ago I posted a configuration for getting [autotest to work with `Test::Unit` outside of Rails](http://opensoul.org/2007/12/6/autotest-without-rails). Ryan Davis, author of [autotest](http://www.zenspider.com/ZSS/Products/ZenTest/), commented on that post saying that it should "Just Work™" without any custom configuration. I was perplexed because I've never been able to get it to work on my gems and Rails plugins.

I finally took time to look into the issue, and realized it's because I always use the Rails naming conventions for my test files. I name them `foo_test.rb`, instead of `test_foo.rb`, which is what Autotest looks for.

That's easily solvable. Here's an Autotest configuration, tested with ZenTest 3.10.0, that should make it work for either naming convention. You can throw this in your `~/.autotest` file, or in a `.autotest` file inside your project.

{% highlight ruby %}
Autotest.add_hook :initialize do |at|
  at.clear_mappings

  at.add_mapping %r%/^lib/(.*)\.rb$% do |_, m|
    possible = File.basename(m[1])
    files_matching %r%^test/.*(#{possible}_test|test_#{possible})\.rb$%
  end

  at.add_mapping(%r%^test/.*\.rb$%) {|filename, _| filename }
end
{% endhighlight %}

Happy autotesting.
