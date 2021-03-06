---

title: "Sinatra and SSL"
id: 4ea72077dabe9d3cb8003e0b
updated: 2011-11-17T16:23:27-05:00
date: 2011-11-16T22:00:00-05:00
tags:
- code
redirect_from: /blog/archives/2011/11/16/sinatra-and-ssl/
---

I recently rolled out SSL support on [Gaug.es](http://get.gaug.es/). Gaug.es is a fairly simple Sinatra application. Most of the app requires authentication, but there are a few public URLs that are unauthenticated.

There two essential steps in securing an app which requires user authentication and then gives them unlimited access to their data:

1.  Only set and use session cookies over secure connections
2.  Mark all cookies as [Secure](http://en.wikipedia.org/wiki/HTTP_cookie#Secure_cookie) so the browser doesn't transmit them when requesting a non-secure URL

I evaluated a couple options, but quickly settled on [Josh Peek's simple rack-ssl](https://github.com/josh/rack-ssl) gem. `Rack::SSL` is a middleware that just redirects `http://` requests to `https://` and marks any cookies set by your app as secure.

I wanted to create a clear separation between the parts of Gaug.es that require authentication and those that don't to avoid accidentally leaking cookies (yeah, that's a technical term), so I moved all the non-authenticated routes to a separate Sinatra application and insert it into the main app. Here's essentially what I ended up with:

{% highlight ruby %}
class Application < Sinatra::Base
  set :ssl, lambda { !development? }

  use PublicApplication
  use Rack::SSL, :exclude => lambda { !ssl? }
  use Rack::Session::Cookie, :expire_after => 1.week, :secret => '…'

  get '/dashboard' do
    'Secure!'
  end
end

class PublicApplication < Sinatra::Base
  get '/' do
    'Hello world'
  end
end
{% endhighlight %}
