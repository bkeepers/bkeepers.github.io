---
layout: post
title: "Graticule and acts_as_geocodable go international"
id: 4cf5b675dabe9d2c6100043e
updated: 2010-11-30T21:44:05-05:00
date: 2007-03-26T20:57:00-04:00
tags:
- code
redirect_from: /blog/archives/2007/03/26/graticule-and-acts_as_geocodable-go-international/
---

The single biggest request that I've gotten for [Graticule](http://opensoul.org/2006/10/31/announcing-graticule-geocoding-api) and [acts\_as\_geocodable](http://opensoul.org/2007/2/13/geocoding-as-easy-as-1-2) has been for international support. So, for those outside the US (50% that read this blog according to google analytics), I have a present for you.

Last weekend I committed support for [Local Search Maps](http://emad.fano.us/blog/?p=277) (thanks to [James Stewart](http://jystewart.net/)), and [PostcodeAnywhere](http://jystewart.net/), both of which have some international support, at least for Canada and Europe. I also added [geocoder.ca](http://geocoder.ca/).

Most of the international geocoding services seem to require a little more structured parameters, so with Graticule 0.2, all of the geocoders can take a hash (and some require it). As a result of gaining international support, the field names that Graticule uses have been changed to be more international-friendly: street, locality, region, postal\_code, and country.

{% highlight ruby %}
g = Graticule.service(:local_search_maps).new
location = g.locate :street => '48 Leicester Square', :locality => 'London', :country => 'UK'
location.coordinates  #=> [51.510036, -0.130427]
{% endhighlight %}

### Geocoding IP Addresses

Several people mentioned that they would rather use acts\_as\_geocodable, but chose to use [GeoKit](http://geokit.rubyforge.org/), another good geocoding library (but with a little different philosophy), because it had support for geocoding IP addresses. So, with a flick of the wrist and a twitch of the nose, Graticule now supports [HostIP](http://hostip.info) for geocoding IP addresses:

{% highlight ruby %}
g = Graitucle.service(:host_ip).new
location = g.locate "64.233.167.99"

location.coordinates  #=> [37.402, -122.078]
location.locality     #=> "Mountain View"
location.country      #=> "US"
location.region       #=> "CA"
{% endhighlight %}

Along with this, acts\_as\_geocodable has a helper method, <code>remote\_location</code>:

{% highlight ruby %}
@nearest_store = Store.find(:nearest, :origin => remote_location) if remote_location
{% endhighlight %}

Be careful not to rely too heavily on remote\_location because the location of many IP addresses cannot be determined through HostIP.

### Feedback

I'm just an ignorant North-American, so I would love some feedback from people using Graticule and acts\_as\_geocodable outside the US.
