---

title: "Testing Facebook with Cucumber"
id: 4cf5b656dabe9d2c610000ab
updated: 2010-11-30T21:43:34-05:00
date: 2009-03-05T21:57:00-05:00
tags:
- code
redirect_from: /blog/archives/2009/03/05/testing-facebook-with-cucumber/
---

For those that haven't heard: [Cucumber](http://cukes.info) is pretty much the greatest thing since sliced bread. It dramatically improved the quality and stability of our applications, and the [outside-in](http://dannorth.net/whats-in-a-story) approach that it encourages forces you to stay focused on what's important.

When we started working on a Facebook application a few months ago, we couldn't fathom not using Cucumber. So we had to figure out a way to test it. It took us a few months to evolve it to a point where we could extract it, but this week we [pushed a change to Facebooker](http://github.com/mmangino/facebooker/commit/cad4ef415f297bfd0ed6ab67bf9d11f4d7ce5150) to make life a little easier. So grab the latest version of Facebooker and keep on reading…

First, in `features/support/env.rb`, replace the default Rails world with the one in Facebooker:

{% highlight ruby %}
# require 'cucumber/rails/world'
require 'facebooker/rails/cucumber'
{% endhighlight %}

### Given I am logged in as a Facebook user

Most of our Facebook application requires that a user be logged in. So most of our scenarios started with "Given I am logged in as a Facebook user".

    Scenario: Uploading a video
      Given I am logged in as a Facebook user
      When I upload a video
      Then I can see a video on my blog

And here is our implementation for that step:

{% highlight ruby %}
Given "I am logged in as a Facebook user" do
  @current_user = User.create! :facebook_id => 1
  @current_user.facebook_user.friends = [
    Facebooker::User.new(:id => 2, :name => 'Bob'),
    Facebooker::User.new(:id => 3, :name => 'Sam')
  ]
  @integration_session.default_request_params.merge!(
    :fb_sig_user => @current_user.facebook_id,
    :fb_sig_friends => @current_user.facebook_user.friends.map(&:id).join(',')
  )
end
{% endhighlight %}

Our application has a `User` model with a `facebook_id` attribute and a `#facebook_user` method which returned an instance of `Facebooker::User`. Due to how the Facebook session is being mocked, it is important that we set our fake user's id to 1 for now (I'll try to figure out a way around this). We also manually add some friends for our application to use. Lastly, we merge in our user's id and friend ids into the default request params so that any requests we make include those parameters.

### Drop your…canvas

There were some places in our app where requests don't go through the canvas. For example, we have a few multipart forms, which have to submit directly to your application. To mimic this, wrap webrat calls in `#without_canvas`:

{% highlight ruby %}
When "I upload a video" do
  visit root_path

  without_canvas do
    fill_in 'Title', :with => 'A video'
    fill_in 'Description', :with => 'Caption for video'
    attach_file 'Video', "#{RAILS_ROOT}/features/support/sample.mpg", "video/mpeg"
    click_button 'Upload Video'
  end
  follow_redirect!
end
{% endhighlight %}

Note that if your action redirects to a URL with `:canvas => true`, webrat will see that as an "external" redirect and won't follow it. Just call `#follow_redirect!` and it'll go on it's merry way.

### Accessing the Facebook API

Instead of making requests to the Facebook API in your tests, Facebooker will try to read a canned response fixture from `features/support/facebook/`. It will give you a friendly error whenever this happens, so just follow the directions and you should be on your way.

### Feedback & Patches

I'm sure there are things that don't work right, so let me know if you run into any troubles. If you have any ideas for making the Cucumber support better, please share them here or on the Facebooker mailing list.
