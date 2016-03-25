---

title: Guilty by attribution
tags:
- commentary
- opensource
---

From [Daniel Stenberg](http://daniel.haxx.se/blog/2016/01/19/subject-urgent-warning/), author of libcurl:

> Back in December I got a desperate email from this person. A woman who said her Instagram had been hacked and since she found my contact info in the app she mailed me and asked for help. I of course replied and said that I have nothing to do with her being hacked but I also have nothing to do with Instagram other than that they use software I’ve written.

…

> Here’s the Instagram screenshot she sent me…
>
> <img alt="screenshot of instagram's open source attribution page" src="http://daniel.haxx.se/blog/wp-content/uploads/2016/01/IMG_2156.jpg" style="max-width: 375px">

I'm curious how often this happens.

---

[@packetmonkey](https://twitter.com/packetmonkey/status/690954107708768256) pointed to [this example from SQLite](http://www.sqlite.org/cgi/src/artifact/3e57a24e2794a94d3cf2342c6d9a884888cd96bf?txt=1&ln=44-66):

```
** Temporary files are named starting with this prefix followed by 16 random
** alphanumeric characters, and no file extension. They are stored in the
** OS's standard temporary file directory, and are deleted prior to exit.
** If sqlite is being embedded in another program, you may wish to change the
** prefix to reflect your program's name, so that if your program exits
** prematurely, old temporary files can be easily identified. This can be done
** using -DSQLITE_TEMP_FILE_PREFIX=myprefix_ on the compiler command line.
**
** 2006-10-31:  The default prefix used to be "sqlite_".  But then
** Mcafee started using SQLite in their anti-virus product and it
** started putting files with the "sqlite" name in the c:/temp folder.
** This annoyed many windows users.  Those users would then do a
** Google search for "sqlite", find the telephone numbers of the
** developers and call to wake them up at night and complain.
** For this reason, the default name prefix is changed to be "sqlite"
** spelled backwards.  So the temp files are still identified, but
** anybody smart enough to figure out the code is also likely smart
** enough to know that calling the developer will not help get rid
** of the file.
```    
