---

title: "ETags with memcached"
id: 4d254397dabe9d797900002e
updated: 2011-01-29T23:58:46-05:00
tags:
- code
redirect_from: /blog/archives/2011/01/29/etags-with-memcached/
---

I love ETags, but there's something that annoys me: most implementations revolve around pulling a record out of a data store and only "rendering" the response if it hasn't been modified.

For example, here is the standard way to implement ETags in Rails:

{% highlight ruby %}
def show
  @article = Article.find(params[:id])

  if stale?(:last_modified => @article.published_at.utc, :etag => @article)
    render :json => @article
  end
end
{% endhighlight %}

The problem with this approach is that request has already gone through most of your application stack–parsing params, authentication, authorization, a few database lookups–so ETags are only saving you render time and some bandwidth.

While working on a Sinatra-based JSON web service that gets very heavy traffic, I wanted to find a way to short-circuit requests and avoid most of the stack if a resource hasn't been modified.

Creating the ETag
-----------------

Since the application is a fairly RESTful web service, it was easy to make the decision that ETags should be tied to models, and invalidated when a record is updated.

I included this module into all of the models:

{% highlight ruby %}
module Etag
  def self.included(base)
    base.after_update :etag!
  end

  # Fetch the current etag
  def etag
    value = $memcache[etag_key] || etag!
    "#{etag_key}:#{value}"
  end

  # Change the etag
  def etag!
    $memcache[etag_key] = ActiveSupport::SecureRandom.base64(16)
  end

  def etag_key
    Digest::SHA1.hexdigest("#{self.class.name}-#{id}")
  end
end
{% endhighlight %}

This gives us an `#etag` method, which stores a random string in a memcache key that is a digest of the class name and id, and returns the key and value. Every time the `#etag` method is called, it will return the same key and the value from memcached.

After the model is updated, the `#etag!` method is called which stores a new random string in the memcached key.

Responding with the ETag
------------------------

Now in the Sinatra application I just return the ETag for the model that is being rendered.

{% highlight ruby %}
get '/games/:id' do
  game = current_user.games.find(params[:id])
  etag game.etag
  game.to_json
end
{% endhighlight %}

Checking the ETag
-----------------

Subsequent requests will contain the ETag, so now it just needs verified using a rack middleware:

{% highlight ruby %}
class EtagMiddleware < Rack::Auth::AbstractHandler
  class Request < Rack::Auth::AbstractRequest
    def cachable?
      etag.present?
    end

    def etag
      @etag ||= @env['HTTP_IF_NONE_MATCH'] && @env['HTTP_IF_NONE_MATCH'].gsub(/^"(.*)"$/, '\1')
    end

    def modified?
      key, value = etag.to_s.split(':', 2)
      $memcache[key] == value
    end
  end

  def call(env)
    request = Request.new(env)

    if request.cachable? && !request.modified?
      [304, {'ETag' => request.etag, 'Cache-Control' => 'private'}, []]
    else
      @app.call(env)
    end
  end
end
{% endhighlight %}

I'm being tricky with the ETag and setting it to a key/value pair. So the middleware just has to look up the key in memcached and see if the value matches. If it does, we know the resource hasn't changed and can render a 304. If the value doesn't match, then the resource has been updated and we process the request as normal.

This approach worked really well for us. It is easy to implement on new resources, and unmodified requests only take a few milliseconds.
