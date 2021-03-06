---

title: "Making RSpec concise"
id: 4cf5b65adabe9d2c61000119
updated: 2010-11-30T21:43:38-05:00
date: 2008-11-09T22:07:00-05:00
tags:
- code
redirect_from: /blog/archives/2008/11/09/making-rspec-concise/
---

A common criticism of [RSpec](http://rspec.info) is that it is very verbose. I don't necessarily agree (or care), but I thought it would be fun to see how concise I could make my specs.

Here are some simple specs from a client project:

{% highlight ruby %}
describe Company do
  before do
    @company = Company.new
  end

  it "should have many classifications" do
    @company.should have_many(:classifications)
  end

  it "should have many industries through companies" do
    @company.should have_many(:industries, :through => :classifications)
  end

  it "should have many locations" do
    @company.should have_many(:locations)
  end

  it "should have many leads" do
    @company.should have_many(:leads)
  end

  it "should have many jobs" do
    @company.should have_many(:jobs)
  end

  it "should have many notes" do
    @company.should have_many(:notes)
  end

  it "should have many phones ordered by phone type position" do
    @company.should have_many(:phones, :as => :phonable,
      :include => :phone_type, :order => 'phone_types.position')
  end

  it "should have many events" do
    @company.should have_many(:events)
  end

  it "should have many interests" do
    @company.should have_many(:interests)
  end

  it "should belong_to an exchange" do
    @company.should belong_to(:exchange)
  end

  it 'should belong_to a primary_contact' do
    @company.should belong_to(:primary_contact, :class_name => 'Job')
  end

  it 'should have many articles' do
    @company.should have_many(:articles,
      :order => 'articles.date DESC, articles.created_at DESC')
  end
end
{% endhighlight %}

These specs check the declared associations on our company model [using some custom matchers](http://github.com/brandon/rspec-on-rails-matchers). They are not very complicated, but are somewhat repetitive. Each example has a description that is basically a duplication of the implementation.

### Step 1: remove the description

For a while now, RSpec has had the ability for matchers to be self describing. If you don't pass a block to `#it`, it uses the description provided by the matcher.

{% highlight ruby %}
it do
  @company.should have_many(:jobs)
end
{% endhighlight %}

When that spec is run, it gives the output <em>"should have a has\_many association called :jobs"</em>. Depending on what you're speccing, the built in description isn't always clear, but in this case it's great.

See [\#simple\_matcher](http://rspec.rubyforge.org/rspec/1.1.11/classes/Spec/Matchers.html#M000441) if you want to create custom matchers with useful error messages.

### Step 2: remove the subject

So the duplication within each example is gone, but if you look at the full spec above, each example calls `@company.should`. Accessing an instance variable isn't what I would consider "duplication", but thanks to a [nifty new feature added to RSpec today](http://github.com/dchelimsky/rspec/commit/dc51a976280b7d9638e9b87c3c7b3c13d3d0b207), it's now unnecessary noise. We can simply call `#should` within our example, and it will use a new instance of the described type as the "subject".

{% highlight ruby %}
describe Company do
  it do
    should have_many(:jobs)
  end
end
{% endhighlight %}

You can customize the subject if you don't simply want a new instance.

{% highlight ruby %}
describe Company, 'validations' do
  subject { Company.new(valid_company_attributes) }

  it do
    should be_valid
  end
end
{% endhighlight %}

*Note: As [David Chelimsky points out in the comments](#comment-9459), this is not released yet and is subject to change.*

### Step 3: One-liner

Lastly, we can use the one line block:

{% highlight ruby %}
describe Company do
  it { should have_many(:classifications) }
  it { should have_many(:events) }
  it { should have_many(:interests) }
  it { should have_many(:jobs) }
  it { should have_many(:leads) }
  it { should have_many(:locations) }
  it { should have_many(:notes) }
  it { should have_many(:articles, :order => 'articles.date DESC, articles.created_at DESC') }
  it { should have_many(:industries, :through => :classifications) }
  it { should have_many(:phones, :as => :phonable, :include => :phone_type, :order => 'phone_types.position') }
  it { should belong_to(:exchange) }
  it { should belong_to(:primary_contact, :class_name => 'Job') }
end
{% endhighlight %}

That's pretty sexy. I wasn't able to do this with all of the specs in my app, but it worked with quite a few of them.
