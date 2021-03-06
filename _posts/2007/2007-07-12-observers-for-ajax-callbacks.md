---

title: "Observers for Ajax callbacks"
id: 4cf5b66ddabe9d2c61000326
updated: 2010-11-30T21:43:57-05:00
date: 2007-07-12T17:21:00-04:00
tags:
- code
redirect_from: /blog/archives/2007/07/12/observers-for-ajax-callbacks/
---

In my Javascript-fu adventures over the past week or so, I've consistently run into the same problem. I want to do slight variations of an Ajax request on an individual basis. Here is a common method from my code: (Note: these examples use `Event.addBehavior` from [Dan Webb's excellent lowpro library](http://www.danwebb.net/2006/9/3/low-pro-unobtrusive-scripting-for-prototype) for registering events.)

{% highlight javascript %}
Event.addBehavior({
  // hijack any forms with the class "new" and submit them using Ajax
  'form.new:submit': function(event) {
    this.request({evalScripts: true,
      onLoading: function() { this.disable(); }.bind(this),
      onComlete: function() { this.enable(); }.bind(this)
    });
    Event.stop(event);
  }
});
{% endhighlight %}

But occasionally, I want a certain form to do something slightly different. For example, I have some forms that are hidden by default and I want to hide them again after they are submitted:

{% highlight javascript %}
Event.addBehavior({
  'form.new.hidden:submit': function(event) {
    this.request({evalScripts: true,
      onLoading: function() { this.disable(); }.bind(this),
      onComlete: function() { this.enable(); }.bind(this),
      onSuccess: function() { new Effect.BlindUp(this); }.bind(this)
    });
    Event.stop(event);
  },
})
{% endhighlight %}

The problems with this are, 1) there is a lot of duplication, and 2) if this form has the "new" class name, it's going to end up with 2 event handlers registered, both making an Ajax request.

So what I want is event observers on `Form.request` and [`Anchor.request`](/2007/7/11/adding-dom-methods-with-prototype) for the Ajax request lifecycle, so I can call `form.request.observe('loading', function() { … })`, and that will be invoked any time an Ajax request is made for that form:

{% highlight javascript %}
Event.addBehavior({
  // submit form requests using ajax
  'form.new:submit': function(event) {
    this.request({evalScripts: true});
    Event.stop(event);
  },

  // register observers to disable and enable the form
  'form.new': function() {
    this.request.observe({
      'loading': function() { this.disable(); }.bind(this),
      'complete': function() { this.enable(); }.bind(this)
    });
  },

  // register an observer to hide the form on success
  'form.new.hidden': function() {
    this.request.observe('success', function() {
      new Effect.BlindUp(this);
    }.bind(this));
  }
})
{% endhighlight %}

And this is where I need your help.

The first problem is that we need some type of event notification framework. I have that part solved by using a [slightly modified version](http://source.collectiveidea.com/public/rails/javascripts/object.event.js) of [Ryan Johnson's Object.Event library](http://livepipe.net/projects/object_event/), which basically allows you to add event observers to any object, and then call them by calling `notify('eventname')` within the object.

Next, I've made a modified version of [Anchor.reqeust method from my post yesterday](/2007/7/11/adding-dom-methods-with-prototype), which calls `notify` on each of the Ajax callbacks, and extends the request methods with the event notification methods:

{% highlight javascript %}
if (!window.Anchor) var Anchor = new Object();

Anchor.Methods = {
  request: function(anchor, options) {
    anchor = $(anchor)
    callbacks = {}
    $A(['loading', 'complete', 'exception', 'failure', 'success']).each(function(event) {
      callbacks['on' + event.capitalize()] = function() {
        anchor.notify.apply(anchor, arguments.unshift(event));
      };
    });
    options = Object.extend(Object.extend({
      method: 'get'
    }, callbacks), options || {});
    return new Ajax.Request(anchor.readAttribute('href'), options);
  }
}
Object.Event.extend(Anchor.Methods.request);
Element.addMethods('a', Anchor.Methods);
{% endhighlight %}

This is where the second problem comes in. While the event notification methods are added to `Anchor.Methods.request`, they don't get added to the anchor objects when the `request` method does. They're getting lost in Prototype's `Element.extend` method that adds the extensions to each element.

And as soon as I get that problem solved, I'm going to have another one: one instance of `Anchor.request` will be shared amongst all the anchor objects, so registering an observer on one will register it for every Ajax request. What I need then is for the event observer to keep track of the registered observers in each object, even though the methods are on the shared `register` function.

I could move the event registration methods to the anchor instead of on the `request` method, but that has problems of it's own. Namely, each element already has an `observe` method for the browser's events, and I can't come up with a better name than `observe`. Besides, I think the methods belong on the request object; they are specific to the Ajax request.

So, does anyone have any good ideas? Is this a lame/unnecessary feature?
