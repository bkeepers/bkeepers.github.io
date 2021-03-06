---

title: "Making cookies with Javascript"
id: 4cf5b66edabe9d2c61000335
updated: 2010-11-30T21:43:58-05:00
date: 2007-07-11T04:21:00-04:00
tags:
- code
redirect_from: /blog/archives/2007/07/11/making-cookies-with-javascript/
---

{% highlight javascript %}
new Cookie({eggs: 1, flour: 3, sugar: 1.5, brownSugar: 1});
{% endhighlight %}

Oh, wait…not those kind of cookies (mmm, now I'm hungry for cookies).

The script.aculo.us wiki has some [code for working with cookies in JavaScript](":http://wiki.script.aculo.us/scriptaculous/show/Cookie). I've extended it a bit to allow for other options when setting the cookies. Here's how to use it:

{% highlight javascript %}
// setting cookies
Cookie.set('name', 'value');

// change domain, path, and expiration in # of days
Cookie.set('name', 'value', {
  domain: 'foobar.com',
  path: '/path',
  expires: 14
});

// the google cookie (doesn't expire)
Cookie.set('name', 'google', {expires: false});

// reading cookies
Cookie.get('name');

// Get an array all cookies that are set
Cookie.all();

// erase a cookie
Cookie.erase('name');

// check if browser accepts cookies
if(Cookie.accept()) {
  // do stuff with cookies
}
{% endhighlight %}

You can grab the code from [here](http://source.collectiveidea.com/public/rails/javascripts/cookie.js).
