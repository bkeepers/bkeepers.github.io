---

title: "Firefox + Mac + Flash + CSS opacity = peek-a-boo"
id: 4cf5b671dabe9d2c610003c2
updated: 2010-11-30T21:44:01-05:00
date: 2007-04-26T09:43:00-04:00
tags:
- code
redirect_from: /blog/archives/2007/04/26/firefox-mac-flash-css-opacity-peek-a-boo/
---

I came across a fun browser bug this morning that I thought I would share. You can't have a semi-transparent element cover a Flash animation Firefox on the mac.

I had a popup menu that used CSS `opacity` to make the menu semi-transparent. It was working fine, but then we threw in a Flash header and the Flash would hide any time you moused over a menu item.

Here are some screenshots that demonstrate the bug. The first is how it looks in Safari, the second demonstrates the bug in Firefox, and the third shows Firefox if I remove the `opacity` attribute from CSS.

p=. <!-- Image not found: /assets/2007/4/26/menu_safari.jpg -->

p=. <!-- Image not found: /assets/2007/4/26/menu_firefix_bug.jpg -->

p=. <!-- Image not found: /assets/2007/4/26/menu_firefox.jpg -->

The solution: for now, I'll just have to live without semi-transparent menus (but they looked so good).

I would venture to guess that this is intentional behavior by Firefox. Since Firefox isn't a native Cocoa app, it doesn't have access to all the fancy OS X rendering, so it can't render transparent elements over elements that it doesn't have control of (Flash), and it just removes the Flash.
