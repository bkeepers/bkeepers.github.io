---

title: "acts_as_audited in development"
id: 4cf5b65bdabe9d2c61000145
updated: 2010-11-30T21:43:39-05:00
date: 2008-10-12T22:10:00-04:00
tags:
- code
redirect_from: /blog/archives/2008/10/12/acts_as_audited-in-development/
---

Thanks to [metatribe](http://github.com/metatribe), a huge annoyance in [acts\_as\_audited](http://github.com/collectiveidea/acts_as_audited) is now fixed: it works in development mode. Due to it's dependance on Rails' cache sweepers, which are only enabled when caching is, acts\_as\_audited didn't work in development mode.

metatribe has a [crafty solution](http://github.com/collectiveidea/acts_as_audited/commit/0f7bce2fec364762fef2662ee8abd72ab6be2672), which took me a few minutes to believe it would even work. So [pull](http://github.com/collectiveidea/acts_as_audited) the latest version and happy auditing.
