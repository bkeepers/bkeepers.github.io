---

title: "Mobile web app developers: I don't know the zip code"
id: 4cf5b667dabe9d2c6100026c
updated: 2010-11-30T21:43:51-05:00
date: 2007-10-16T22:23:00-04:00
tags:
redirect_from: /blog/archives/2007/10/16/mobile-web-app-developers-i-don-t-know-the-zip-code/
---

If you're developing a mobile application, and you need to know a user's location, please, please don't use ZIP code as the only means of finding it. If your app is useful at all outside of my home area, I'm not going to know the ZIP code. This is especially true for apps that provide [traffic data](http://ip.kaapps.com/traffic/), [movie listings](http://moviesapp.com/), or weather. The chance that I'm going to want to access that kind of data somewhere that I don't know the ZIP code is highly likely. So let me enter the city and state. If you're writing your app in Rails, [here is a tool that will give you the zip code](http://graticule.rubyforge.org).
