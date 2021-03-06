---

title: "Add helper methods to your Rails console"
id: 509bbfffdabe9d0829004369
updated: 2012-11-09T09:27:04-05:00
date: 2012-11-08T09:00:00-05:00
tags:
- code
redirect_from: /blog/archives/2012/11/08/add-helper-methods-to-your-rails-console/
---

If you use the console on your production application with any regularity, then having helpers for your application is a must! I use the console on [Speaker Deck](https://speakerdeck.com) often to debug issues processing PDFs. I almost always start by finding a user by their username or a talk by its URL, so I added helpers to make it brainless.

Adding helpers to the Rails 3 console is easy. Define your helper methods in a module in your `lib` directory.

{% highlight ruby %}
module SpeakerDeck
  # These methods are included into the Rails console
  module Console
    # Find a user by username
    def u(username)
      User.find_by_username!(username)
    end

    # Find a talk by url, e.g. "holman/how-to-be-sexy-like-me"
    def t(param)
      username, slug = param.split('/')
      Talk.find_by_username_and_slug!(username, slug)
    end
  end
end
{% endhighlight %}

Then, in your `application.rb` file, pass a block to `#console` that includes your module into `Rails::ConsoleMethods`.

{% highlight ruby %}
module SpeakerDeck
  class Application < Rails::Application
    # …

    console do
      require 'speaker_deck/console'
      Rails::ConsoleMethods.send :include, SpeakerDeck::Console
    end
  end
end
{% endhighlight %}

Now, when you run `rails console`, your methods are available.

    >> user = u 'bkeepers'
    => #
    >> talk = t 'sachag/side-projects'
    => #
