---

title: "Location-based search with Sphinx and acts_as_geocodable"
id: 4cf5b655dabe9d2c61000091
updated: 2010-11-30T21:43:33-05:00
date: 2009-04-14T20:48:00-04:00
tags:
- code
redirect_from: /blog/archives/2009/04/14/location-based-search-with-sphinx-and-acts_as_geocodable/
---

[Sphinx](http://www.sphinxsearch.com/), everybody's favorite search engine, has support for location-based search, giving you geo-aware, full-text searching. So now you can find all of the garage sales on Saturday within 20 miles that have LPs and a reel mower.

All you need to do is add latitude and longitude (in radians) to the index, allowing you to limit the results to records within a distance of a point. The hardest part is getting the coordinates, but [acts\_as\_geocodable](http://github.com/collectiveidea/acts_as_geocodable) makes that really easy.

To start, install [acts\_as\_geocodable](http://github.com/collectiveidea/acts_as_geocodable). Once you have that configured properly, install [ThinkingSphinx](http://ts.freelancing-gods.com/), define an index on your geocodable model and add the coordinates to the index:

{% highlight ruby %}
class Listing < ActiveRecord::Base
  acts_as_geocodable

  define_index do
    indexes title
    indexes description

    has geocoding.geocode(:id), :as => :geocode_id
    has 'RADIANS(geocodes.latitude)', :as => :latitude, :type => :float
    has 'RADIANS(geocodes.longitude)', :as => :longitude, :type => :float
  end
end
{% endhighlight %}

The three lines that start with `has` add the geocode id, and the latitude and longitude in radians to the index. Our index doesn't need the geocode id, but we have to add it so that ThinkingSphinx properly joins the geocodes table.

After you rebuild the index and start the daemon, you can search for records by location. Here's an example of taking a zip code from a user and finding all records with in 20 miles. (**Note:** you will need to grab the latest version, 0.2.9, of Graticule for this next bit of code to work)

{% highlight ruby %}
def search
  location = Geocode.geocoder.locate(params[:zip]).coordinates.map(&:to_radians)
  @listings = Listing.search(params[:q], :geo => location,
    :with => {'@geodist' => 0.0..(20 * 1610.0)})
end
{% endhighlight %}

After looking up the coordinates of the zip code that the user entered, we do a search with the `:geo` parameter, limiting the results using the special <code>@geodist</code> condition. We have to pass in a range of floats that represent the distance of the points in meters
(and since the US is in the stone age, I'm converting from miles).

That's all there is to it. Now go write some cool location-based search and comment here about it.
