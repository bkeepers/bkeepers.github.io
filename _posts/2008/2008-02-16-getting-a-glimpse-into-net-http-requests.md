---

title: "Getting a glimpse into Net::HTTP requests"
id: 4cf5b663dabe9d2c61000228
updated: 2010-11-30T21:43:48-05:00
date: 2008-02-16T11:20:00-05:00
tags:
- code
redirect_from: /blog/archives/2008/02/16/getting-a-glimpse-into-net-http-requests/
---

While trying to debug some HTTP code, I wanted to be able to see what the actual HTTP request looked before it was sent. So, I added a `#to_s` method:

{% highlight ruby %}
require 'stringio'

class Net::HTTPGenericRequest
  def to_s
    io = StringIO.new
    exec(io, '1.1', path)
    io.string
  end
end
{% endhighlight %}

All the built in requests extend `HTTPGenericRequest`, so now I can call `#to_s` on any request:

{% highlight ruby %}
request = request = Net::HTTP::Get.new('/some/path')
request.set_content_type 'text/html'
request.basic_auth 'username', 'password'

puts request.to_s
{% endhighlight %}

Which gives me:

    GET /some/path HTTP/1.1
    Accept: */*
    Content-Type: text/html
    Authorization: Basic dXNlcm5hbWU6cGFzc3dvcmQ=

I had also intended to add a `#to_s` method to the response, but it wasn't obvious how to accomplish that, and I found my bug before I needed it. So, if anyone feels ambitious…
