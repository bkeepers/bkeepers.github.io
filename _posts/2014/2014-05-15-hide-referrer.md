---
title: Hide referrer when clicking a link
layout: post
tags:
- javascript
- web
excerpt: <p>Sometimes referrers reveal sensitive information. Wouldn't it be nice if there was a way to hide them when you needed to?</p>
---

Hyperlinks are the foundation of the world wide web. Clicking one instantly teleports you to some new magical land. This teleporter has one interesting feature/defect: It tells everyone at your new destination exactly where you came from, called a "referer" ([yes, it was mispelled in the original HTTP spec](http://en.wikipedia.org/wiki/HTTP_referer)). Usually you don't care, and sometimes referrers are even helpful. But sometimes, as [Dropbox recently discovered](https://blog.dropbox.com/2014/05/web-vulnerability-affecting-shared-links/), referrers reveal sensitive information. Wouldn't it be nice if there was a way to hide them when you needed to?

Way back in the day when we were building [gaug.es](http://get.gaug.es), we wanted to be able to click on links in our admin interface that would take us to our users' websites, but we didn't want the referrer to reveal where we were coming from. After some fiddling, we arrived at this clever JavaScript snippet that does just that: it opens a new blank window and visits the clicked URL as if the user typed the URL in themselves.

```javascript
function openWithoutReferrer(url) {
  var site = window.open("", "hide_referrer");
  site.document.open();
  site.document.writeln('<script type="text/javascript">window.location = "' + url + '";</script>');
  site.document.close();
}
```

You can use jQuery to attach this to any link with the `hide-referrer` class. Note that due to popup blocking techniques, `openWithoutReferrer` has to be called in a click handler.

```javascript
// Open links with "hide-referrer" class without sending the referrer
$(document).on('click', 'a.hide-referrer', function(e) {
  e.preventDefault();
  openWithoutReferrer(e.target.href);
});
```

On another project I used the same method, but I didn't ever want to leak referrer information to any external site.

```javascript
// Open external links without sending the referrer
$(document).on('click', 'a', function(e) {
  href = e.target.getAttribute('href')
  if(href && href.hostname != window.location.hostname) {
    e.preventDefault();
    openWithoutReferrer(this.href);
  }  
});
```

There are a couple caveats to this solution:

1. It requires that the user have JavaScript enabled. If they don't (because traveled here in a time machine from the 90s and are using Netscape 2, or they are trying to be malicious), referrers will still be sent. You could work around this by setting `data-href` instead of `href` on all `<a>` tags and update the snippet above accordingly. This will require JavaScript to make any links work.
2. It always opens the link in a new window. To my knowledge, there is not a way to do this without opening a new window.

Despite the caveats, I've found this to be effective in the couple scenarios that I needed it.
