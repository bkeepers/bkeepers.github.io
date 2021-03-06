---

title: "Announcing Graticule geocoding API"
id: 4cf5b67fdabe9d2c61000568
updated: 2010-11-30T21:44:15-05:00
date: 2006-10-31T10:36:00-05:00
tags:
- code
redirect_from: /blog/archives/2006/10/31/announcing-graticule-geocoding-api/
---

**update**: Graticule is now [hosted on Rubyforge](http://graticule.rubyforge.org/).

Graticule is a geocoding API for interpolating address data into geographic coordinates written in Ruby. The goal is to provide a consistent interface into the various geocoding services, allowing other libraries to be built on top of them while remaining agnostic of the specific service that is being used.

In its current state, Graticule is just a repackaging of the different gems produced by [Eric Hodel of Robot Co-op](http://dev.robotcoop.com/Libraries/). It currently supports the Yahoo, Google, Geocoder.us, and MetaCarta APIs. The plan is to expand upon them.

### Usage

You can grab the [gem](http://rubyforge.org/frs/?group_id=2643&release_id=8463) or check out the code from [Subversion](http://github.com/collectiveidea.com/graticule). The [Rdoc is also available](http://graticule.rubyforge.org/).

{% highlight ruby %}
require 'rubygems'
require 'graticule'
geocoder = Graticule.service(:google).new "api_key"
location = geocoder.locate "1600 Amphitheatre Parkway, Mountain View, CA"
{% endhighlight %}

### Feedback

I'd love to get your feedback. There are a few places where the API is still not consistent (e.g. Yahoo returns multiple results). I'd also appreciate any help with packaging and releasing as I am a newbie at creating Gems.
