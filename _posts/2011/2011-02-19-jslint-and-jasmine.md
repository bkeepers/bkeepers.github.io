---

title: "JSLint and Jasmine"
id: 4d6093f4dabe9d1aac00006f
updated: 2011-09-14T10:19:10-04:00
date: 2011-02-19T23:11:00-05:00
tags:
- code
redirect_from: /blog/archives/2011/02/19/jslint-and-jasmine/
---

[Lucid](https://github.com/bkeepers/lucid) is a JavaScript framework I am creating which encapsulates ideas from several large JavaScript applications. I'm sure I'll be writing about it more as it matures, but for now I want to highlight a commit I made tonight.

I've been looking for a way to integrate [JSLint](http://www.jslint.com/) (or [JSHint](http://jshint.com/), a slightly more sane version of JSLint) into the "build process" of my JavaScript-heavy apps, and it recently occurred to me that it should just be part of the test suite.

I've been using [Jasmine](https://github.com/pivotal/jasmine) a lot lately, and it was rather trivial to add a [spec that runs all my src and spec files through JSHint](https://github.com/bkeepers/lucid/blob/master/spec/javascripts/z_jshint_spec.js). Now I can immediately see where I have poor syntax:

<img alt="Screenshot of jshint output" src="/images/jshint.png">
