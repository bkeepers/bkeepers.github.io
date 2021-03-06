---

title: "Graticule and MapQuest?"
id: 4cf5b658dabe9d2c610000f1
updated: 2010-11-30T21:43:36-05:00
date: 2008-12-13T11:15:00-05:00
tags:
- code
redirect_from: /blog/archives/2008/12/13/graticule-and-mapquest/
---

MapQuest has sent out several emails about their current geocoding API being discontinued. Here is the latest:

<blockquote>
Dear MapQuest Platform Customer,

At the start of the New Year, MapQuest will be retiring the MapQuest OpenAPI product, having launched the more feature rich MapQuest Platform: Free Edition product. Since the MapQuest OpenAPI does not use the same backend as our newer APIs, nor does it provide the breadth in functionality, we want to provide you with a better free experience. Don't wait - make the switch today!

If your application is currently being powered by the MapQuest OpenAPI product, you will need to migrate to one of 6 APIs available in the MapQuest Platform: Free Edition product prior to January 31, 2009.

Our MapQuest Platform: Free Edition product offers more flexibility and ease of development along with providing developer choice with six APIs:

SERVER SIDE APIs
Java
C++
.NET

CLIENT SIDE APIs
JavaScript
AS3 (ActionScript 3: Flash, Flex, AIR)
FUJAX (Write JavaScript, output Flash)

Our MapQuest Platform: Free Edition product includes many additional features including:

-   COLLECTIONS: Support for multiple and remote collections (KML and GeoRSS); allowing easier handling of shape collections.
-   ADVANCED SHAPE OVERLAYS: Build applications that allow users to create and interact with a variety of overlays on maps, including custom lines, polygons, rectangles, and ellipses.
-   CUSTOM TILE LAYER SUPPORT.
-   Add REAL-TIME TRAFFIC to your map.
-   GLOBE VIEW: http://globe.mapquest.com.
-   AERIAL IMAGERY and HYBRID VIEWS.
-   SMART ROLLOVERS: Rollover windows that adapt their size and positioning based on the content placed in the window.
-   ADVANCED MAP MARKERS: With the MapQuest "declutter mode," automatically move collided markers to positions on the map with a leader link pointing to their original location.

The MapQuest OpenAPI product servers will go offline on Saturday, January 31st, 2009. Please plan on migrating your application before this date or applications based on the MapQuest OpenAPI product will stop working.

You can find documentation and downloads for the MapQuest Platform: Free Edition product on our Developer Network: http://developer.mapquest.com.

Additional information can be found on:
http://platform.mapquest.com & http://devblog.mapquest.com.

Thank you,

MapQuest, Inc.

</blockquote>
[Graticule](http://github.com/collectiveidea/graticule), a ruby wrapper around many popular geocoding APIs, uses the old MapQuest API. I don't use it, and I don't know if anyone else does, so I'm leaving it to you, lazyweb: If you use the MapQuest API, or want to in the future, fork [graticule on GitHub](http://github.com/collectiveidea/graticule) and update the MapQuest wrapper.
