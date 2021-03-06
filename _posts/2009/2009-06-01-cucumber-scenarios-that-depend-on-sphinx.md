---

title: "Cucumber scenarios that depend on Sphinx"
id: 4cf5b654dabe9d2c61000074
updated: 2010-11-30T21:43:32-05:00
date: 2009-06-01T09:18:00-04:00
tags:
- code
redirect_from: /blog/archives/2009/06/01/cucumber-scenarios-that-depend-on-sphinx/
---

I love writing apps that make heavy use of search indexes, but testing them can be a bit of a pain. Here is how I got [ThinkingSphinx](http://freelancing-god.github.com/ts/en/) to play nice with [Cucumber](http://cukes.info).

Here is the relevant part of what I put in `features/support/env.rb`:

{% highlight ruby %}
# Cucumber::Rails.use_transactional_fixtures

# http://github.com/bmabey/database_cleaner
require 'database_cleaner'
DatabaseCleaner.strategy = :truncation
Before do
  DatabaseCleaner.clean
end

ts = ThinkingSphinx::Configuration.instance
ts.build
FileUtils.mkdir_p ts.searchd_file_path
ts.controller.index
ts.controller.start
at_exit do
  ts.controller.stop
end
ThinkingSphinx.deltas_enabled = true
ThinkingSphinx.updates_enabled = true
ThinkingSphinx.suppress_delta_output = true

# Re-generate the index before each Scenario
Before do
  ts.controller.index
end
{% endhighlight %}

### What's going on here?

Start by commenting out the line about using transactional fixtures in `env.rb`. Using transactional fixtures will run each scenario inside of a transaction and roll it back at the end of the scenario to revert the database state. Thinking Sphinx uses an `after_commit` callback for kicking off the delta indexing, but the callback never gets run when transactional fixtures are enabled because the entire scenario is run inside of a big transaction.

Once we've disabled transactional fixtures, our test database will start to fill up, likely causing some problems. So we need to add a `Before` block that clears out the database before each scenario. I'm using [database\_cleaner](http://github.com/bmabey/database_cleaner/tree/master), which gives you some different strategies for cleaning the database. Alternatively, the brute-force solution is just to reload the schema before each scenario, but this is slower than truncating the data.

{% highlight ruby %}
Before do
  ActiveRecord::Base.establish_connection(ActiveRecord::Base.configurations['test'])
  ActiveRecord::Schema.verbose = false
  load "#{RAILS_ROOT}/db/schema.rb"
end
{% endhighlight %}

Next, we start Sphinx when `env.rb` is loaded, and shut it down when the Ruby process exists. We also enable deltas and updates, which are disabled by default in test mode. Finally, we define a `Before` block that updates the index before each scenario so we don't end up with a stale index.

### Putting it all together

I'm using Sphinx's [delayed delta support](http://opensoul.org/2009/4/30/keepin-sphinx-indexes-fresh-2), so whenever I update records, I need to have delayed\_job process jobs. Instead of trying to get delayed\_job to run in the background, I took the easy way out and defined a step: "When the system processes jobs".

    Scenario: Posting a new listing
      Given I am logged in as "MovinMan"
      When I create a new listing titled "Lots of Boxes" near "49423"
      And the system processes jobs
      And I browse listings near "49423"
      Then I can see a listing titled "Lots of Boxes"

Which is just implemented as:

{% highlight ruby %}
When 'the system processes jobs' do
  Delayed::Job.work_off
end
{% endhighlight %}

If you're just using the default deltas, and not delayed deltas, then you can update the index like this:

{% highlight ruby %}
When /^the system updates the index$/ do
  MyModel.sphinx_indexes.first.delta_object.index(MyModel)
end
{% endhighlight %}

I hope that helps. Post your suggestions in the comments for improving this.
