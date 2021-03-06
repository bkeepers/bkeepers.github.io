---

title: "Firebug lite for all those other browsers"
id: 4cf5b66edabe9d2c6100034b
updated: 2010-11-30T21:43:58-05:00
date: 2007-07-02T16:45:00-04:00
tags:
- code
redirect_from: /blog/archives/2007/07/02/firebug-lite-for-all-those-other-browsers/
---

If for some reason you use one of those other browsers, then you don't have the pleasure of using [Firebug](http://www.getfirebug.com/) for debugging (Safari nuts, I know you secretly debug your javascript and stylesheets with Firebug in Firefox, despite it "not looking like a Mac app").

Fortunately for you, there's [Firebug Lite](http://www.getfirebug.com/lite.html). From the website:

> Firebug is an extension for Firefox, but what happens when you need to test your pages in Internet Explorer, Opera, and Safari? If you are using console.log() to write to Firebug's console, you'll wind up with JavaScript errors in these other browsers, and that's no fun.

> The solution is Firebug Lite, a JavaScript file you can insert into your pages to simulate the Firebug console in browsers that are not named "Firefox".

To ease the pain of debugging Javascript in those other browsers, I've thrown together a little plugin that automagically includes Firebug Lite into your application in development mode. All you need to do is [install the plugin](http://source.collectiveidea.com/public/rails/plugins/firebug) and include the default javascripts in your layout (which you're probably already doing):

{% highlight erb %}
<%= javascript_include_tag :defaults %>
{% endhighlight %}

Just hit F12 (Ctrl+F12 on Mac) to open Firebug Lite on any page, or jump the focus directly to the command line with Ctrl+Shift+L (or ⌘+Shift+L on Mac).

<!-- Image not found: /assets/2007/7/2/firebug_in_safari.png -->
    http://source.collectiveidea.com/public/rails/plugins/firebug
