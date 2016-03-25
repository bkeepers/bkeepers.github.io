---

title: "Geocoding as easy as 1-2..."
id: 4cf5b677dabe9d2c61000493
updated: 2010-11-30T21:44:07-05:00
date: 2007-02-13T00:04:00-05:00
tags:
- code
redirect_from: /blog/archives/2007/02/13/geocoding-as-easy-as-1-2/
---

3?, nope there is no 3. Geocoding as easy as 1-2!

1.  Create your models
2.  Find them!

{% highlight ruby %}
event = Event.create :street => "777 NE Martin Luther King, Jr. Blvd.",
  :city => "Portland", :region => "Oregon", :postal_code => 97232

# how far am I from RailsConf 2007?
event.distance_to "49423" #=> 1807.66560483205

# Find our new event, and any other ones in the area
Event.find(:all, :within => 50, :origin => "97232")

# Find the nearest restaurant with beer
Restaurant.find(:nearest, :origin => event, :conditions => 'beer = true')
{% endhighlight %}

I know you're excited, so instead of blabbing on-and-on, FAQ-style:

### How are you performing this voodoo?

A slick new plugin called [acts\_as\_geocodable](http://github.com/collectiveidea/acts_as_geocodable).

### How do I get it?

    script/plugin install -x git://github.com/collectiveidea/acts_as_geocodable.git

### How do I set it up?

Its all in the [README](http://github.com/collectiveidea/acts_as_geocodable/tree/master/README).

### Why did you write this when there's already several geocoding plugins?

The Ruby geocoding space is pretty fragmented right now. There's [all](http://rubyforge.org/projects/geocoder/) [kinds](http://rubyforge.org/projects/actsasmappable/) of [geocoders](http://rubyforge.org/projects/geokit/) [available](http://plugins.mosaicglobe.org/svn/trunk/acts_as_geocode/), and none of them provide everything. We're determined to fix that with [Graticule](http://rubyforge.org/projects/graticule/) and acts\_as\_geocodable.

We believe that all the heavy lifting of geocoding, distance calculations, etc., should be left to a gem, and only code that is directly related to Rails should be a Rails plugin. Even more, all the different geocoders should be available in the same package and have the same interface. A plugin should then be built on top of the gem that makes your apps geo-capabilities seem like voodoo.

We started our own projects because we didn't think anyone else got it right. Recently, [Bill Eisenhaur](http://blog.billeisenhauer.com/) and [Andre Lewis](http://earthcode.com/) did a [pretty good job](http://rubyforge.org/projects/geokit/), and we borrowed some of their ideas, but I still have issues with their approach and code, mainly that it's all tied up into a Rails plugin.

### Did you get it right?

I think we have a great foundation. It's not perfect, nor does it have all the features of the other packages, but I think it is well architected.

### Why don't you work together?

Excellent idea! We would love to.

### How does this fit in with [JWZ's use case](http://www.jwz.org/doc/groupware.html?)

(Why are you asking this?) A third of the problem is knowing where, a third is when, and a third is who. You're on your own for the who and when.

Happy geocoding!
