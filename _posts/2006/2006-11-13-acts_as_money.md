---

title: "acts_as_money"
id: 4cf5b67edabe9d2c61000563
updated: 2010-11-30T21:44:14-05:00
date: 2006-11-13T14:11:00-05:00
tags:
- code
redirect_from: /blog/archives/2006/11/13/acts_as_money/
---

At [Collective Idea](http://collectiveidea.com), we often try to take pieces of code that we use often and extract them into plugins. We're trying to get better about making them available, so, here we go:

<code>acts\_as\_money</code> is a fairly trivial plugin that has proved to be very useful. It just makes it a little easier to work with the [money](http://rubyforge.org/projects/money/) gem.

{% highlight ruby %}
class Product < ActiveRecord::Base
  money :price
end
{% endhighlight %}

This assumes that there are 2 columns in the database, <code>cents</code> (integer) and <code>currency</code> (string). These fields can be changed by setting the :cents and :currency options. To use the default currency, you can simple set :currency option to false and not have a currency field.

{% highlight ruby %}
class Room < ActiveRecord::Base
  money :rate, :cents => :rate_in_cents, :currency => :rate_currency
  money :discount, :cents => :discount_in_cents, :currency => false
end
{% endhighlight %}

<code>acts\_as\_money</code> also incorporates a [patch to <code>composed\_of</code>](http://dev.rubyonrails.org/ticket/6322) that I submitted to core that allows you to pass a String, Fixnum, Float or Money object as a parameter to the setter, and it will call \#to\_money to convert it to a Money object. This makes it convenient for using money fields in forms.

{% highlight ruby %}
r = Room.new :rate => "100.00"
r.rate                            # returns &lt;Money:0x249ef9c @currency="USD", @cents=10000&gt;
{% endhighlight %}

### Installation

    script/plugin install git://github.com/collectiveidea/acts_as_money.git

Hope you find this useful. I know I've been using it in any app that handles money, and it's been a time saver. Allowing me to use a <code>composed\_of</code> field in forms has been extremely helpful.
