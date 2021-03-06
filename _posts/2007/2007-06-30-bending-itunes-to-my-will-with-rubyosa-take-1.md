---

title: "Bending iTunes to my will with RubyOSA: take 1"
id: 4cf5b66edabe9d2c61000353
updated: 2010-11-30T21:43:59-05:00
date: 2007-06-30T07:15:00-04:00
tags:
- code
redirect_from: /blog/archives/2007/06/30/bending-itunes-to-my-will-with-rubyosa-take-1/
---

A couple months ago I [expressed my frustration about iTunes not letting me move podcast files into my library](/2007/4/17/moving-podcast-tracks-into-your-itunes-library). Several people commented with suggestions, such as converting the ID3 tag to an older version, re-importing the track, and then converting the ID3 tag back to 2.4. This is definitely better than the solution I had found, but still a pain.

I tried to find a scriptable solution, but iTunes doesn't expose, though AppleScript, the ability to change the ID3 tag version or the mystical ID3 tag attribute that tells iTunes that it's a podcast.

So, I've turned to Ruby. Though a little introspection and experimentation with [ID3lib-ruby](http://ID3lib-ruby.rubyforge.org/), I've figured out that it is the [`CTO`](http://id3lib.sourceforge.net/id3/id3v2com-00.html#tco) (Content Type) ID3v2 tag set to "Podcast" that iTunes is using to put the files in the Podcasts folder. Clearing the `CTO` tag and readding the track in iTunes will move it into the Library.

So, with [RubyOSA](http://rubyosa.rubyforge.org), I've written a little script that will loop through the selected tracks in iTunes and clear the `CTO` ID3 tag.

{% highlight ruby %}
require 'rubygems'
require 'rbosa'
require 'ID3lib'

itunes = OSA.app('itunes')
itunes.selection.get.each do |track|
  if track.is_a?(OSA::Itunes::Track)
    location = URI.decode(URI.parse(track.location.__data__('furl')).path)
    tag = ID3Lib::Tag.new(location)
    tag.content_type = nil
    tag.update!
  end
end
{% endhighlight %}

There are a few remaining problems that I would like to tackle:

1.  I can't figure out how to delete and add the track through RubyOSA. There is a delete method on the track, but doesn't appear to do anything.
2.  I want the script to display a dialog confirming the actions about to take place.
3.  I want to be able to execute the script from the Scripts menu in iTunes, which appears to involve installing [OSA Components](http://homepage.mac.com/philip_aker/osa/osa.html).

Overall, this has been a fun experiment (and a reason to play with RubyOSA). I'm looking forward to Leopard when this is all built in!
