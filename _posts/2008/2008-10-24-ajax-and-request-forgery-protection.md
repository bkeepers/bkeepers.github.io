---

title: "Ajax and Request Forgery Protection"
id: 4cf5b65adabe9d2c61000129
updated: 2010-11-30T21:43:38-05:00
date: 2008-10-24T00:52:00-04:00
tags:
- code
redirect_from: /blog/archives/2008/10/24/ajax-and-request-forgery-protection/
---

Rails 2.1 added protection for [cross-site request forgery](http://en.wikipedia.org/wiki/Cross-site_request_forgery) by embedding a session-based token in generated forms. Rails will not process a POSTed request without the token. For the most part, this protection is transparent. But occasionally, an Ajax request request gets left out in the cold without a token.

If your Ajax request is tied to a form on the page, then all is good because the form already has the authenticity token in it. It only happens when your Ajax request is not tied to a form but makes a `POST` request, which is a rare but occasionally useful.

So how do we let those Ajax requests in on the fun? We came up with the ingenious idea of just embedding the authenticity token in a meta tag on every page, which can then be used in the Javascript.

{% highlight erb %}
<meta name="authenticity-token" id="authenticity-token" content="<%= form_authenticity_token %>" />
{% endhighlight %}

The authenticity token is unique for each visitor, and already included in other parts of the page, so this doesn't defeat the purpose of the request forgery protection.

We usually add a couple convenience methods for accessing the token in Javascript.

{% highlight javascript %}
var Application = {
  authenticityToken: function() {
    return $('authenticity-token').content;
  },

  authenticityTokenParameter: function(){
   return 'authenticity_token=' + encodeURIComponent(Application.authenticityToken());
  }
}
{% endhighlight %}

Now, we have easy access to it whenever we need it.

{% highlight javascript %}
new Ajax.Request(url, {
  parameters: Application.authenticityTokenParameter()
});
{% endhighlight %}
