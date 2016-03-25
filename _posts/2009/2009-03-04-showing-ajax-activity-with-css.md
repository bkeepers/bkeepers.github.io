---

title: "Showing Ajax activity with CSS"
id: 4cf5b656dabe9d2c610000b1
updated: 2010-11-30T21:43:34-05:00
date: 2009-03-04T07:00:00-05:00
tags:
- code
redirect_from: /blog/archives/2009/03/04/showing-ajax-activity-with-css/
---

You know when you have a form that submits with Ajax, and you want to show some type of activity on the form? There's several ways to do this, like including a hidden image that you show and hide while there is activity, or inserting and removing an image with javascript. These all just feel too dirty to me. I don't want to have to change the markup just because the form is submitting via Ajax.

As usual, there's a cleaner way to do it with just CSS. I've used this simple but effective trick on a couple projects now, so I thought I would share.

First, here is a demo of what it looks like: (sorry, you'll have to leave your feed reader.)

<form id="loading_example" class="example">
  <p style="text-align: center;"><strong>Click the save button.</strong></p>
  <div class="buttons">
    <input type="submit" value="Save"/>
    or <a href="#">Cancel</a>
  </div>
</form>

<style type="text/css">
  #loading_example {
    margin: 1em 3em;
    padding: 1em;
    border: 4px solid #CCC;
    border-radius: 10px;
    -moz-border-radius: 10px;
    -webkit-border-radius: 10px;
  }
  form.example .buttons { text-align: center; }
  form.example.loading .buttons {
    text-indent: -2000px;
    overflow: hidden;
    background: url(/assets/2009/3/4/loading.gif) no-repeat center center;
  }
  form.example.loading .buttons * { visibility: hidden; }
</style>

<script type="text/javascript">
$('loading_example').observe('submit', function(event) {
  event.stop();
  this.addClassName('loading');
  setTimeout(function() {
    this.removeClassName('loading');
  }.bind(this), 3000);
});
</script>

This technique is very simple. It adds a class on the form with Javascript while it is loading, and then removes it once it's done. The loading class hides the submit button and replaces it with a background image, usually an animated gif.

First, with Javascript, add a class to the form while the Ajax request is loading. It would look something like this in Prototype:

{% highlight javascript %}
$('my_form').observe('submit', function(event) {
  event.stop();
  this.request({
    evalScripts: true,
    onLoading:  function() { this.addClassName('loading'); }.bind(this),
    onComplete: function() { this.removeClassName('loading'); }.bind(this)
  });
});
{% endhighlight %}

Next, wrap an element around your buttons or whatever you want to hide.

{% highlight html %}
<form>
  <div class="buttons">…</div>
</form>
{% endhighlight %}

Lastly, there's just a little CSS to hide buttons and any elements inside them, and set the background image:

{% highlight css %}
form .buttons { text-align: center; }
form.loading .buttons {
  text-indent: -2000px;
  overflow: hidden;
  background: url(../images/loading.gif) no-repeat center center;
}
form.loading .buttons * { visibility: hidden; }
{% endhighlight %}

There you have it. It's really simple, but it's worked well.
