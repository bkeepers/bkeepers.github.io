---
layout: post
title: "User auditing with acts_as_audited"
id: 4cf5b67ddabe9d2c6100053b
updated: 2010-11-30T21:44:13-05:00
date: 2006-11-19T00:39:00-05:00
tags:
- code
redirect_from: /blog/archives/2006/11/19/user-auditing-with-acts_as_audited/
---

Thanks to [Chaz](/2006/7/21/acts_as_audited#comment-656) for pointing out the section in the [Rails Recipes](http://www.pragmaticprogrammer.com/titles/fr_rr/index.html) book about using Rails' <code>cache\_sweeper</code> to implement auditing. I've updated [<code>acts\_as\_audited</code>](/2006/7/21/acts_as_audited) so that it can quickly and easily audit modifications to your models along with the user that made the change. Check out the [original post](/2006/7/21/acts_as_audited) for more information and examples of how to use it.
