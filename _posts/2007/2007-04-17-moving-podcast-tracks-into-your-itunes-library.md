---
layout: post
title: "Moving Podcast tracks into your iTunes library"
id: 4cf5b673dabe9d2c6100040d
updated: 2010-12-01T02:31:25-05:00
date: 2007-04-17T09:33:00-04:00
tags:
- life
- popular
redirect_from: /blog/archives/2007/04/17/moving-podcast-tracks-into-your-itunes-library/
---

A while back, [Daniel posted about building an instant indie music collection](http://ifstatement.blogspot.com/2006/06/howto-build-and-instant-indie-music.html) by subscribing to KEXP's [Song of the day](http://kexp.org/podcasting/podcasting.asp#song) podcast. I did that, and it's been great. Now I have all this great indie music, but the problem is that it's locked up in an iTunes podcast. I can't continually listen to it because iTunes plays podcasts one track at a time.

I've been mildly annoyed about this for a few months, but this past weekend I thought I would try to remedy that. I tried importing the mp3 files into the library, and all that did was make each track appear twice in the podcast. So, I tried copying all the files to an external folder, deleting them from the podcast, and then re-importing the files; iTunes re-adds them to the podcast.

After scouring mailing lists and forums, it turns out that the only (known) way to accomplish this is to right click on the files and select "Convert Selection to AAC" (or whatever encoding format you use). This re-encodes the file as AAC and adds it to your library, and now you can delete it from the podcast. This is really annoying. Why do I need to re-encode the files (further decreasing the sound quality)?

You see, iTunes tries to be smart (or it's too dumb, one of those two). I had a similar problem when I imported an audio book from CD and wanted it to show up under "Audiobooks" in my library. One would think this would be as simple as setting the genre on the tracks, but it turns out, the files have to be encoded in AAC and saved with a .m4b file extension (there's an [applescript available to automate this](http://dougscripts.com/itunes/scripts/scripts07.php?page=1#makebookmarkable)). All of this makes me think that the whole Library pane in iTunes is a big hack. It only works right when you buy stuff from the iTunes store. Annoying!
