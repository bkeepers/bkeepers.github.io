---

title: "Push Upstream"
id: 4cf5b65adabe9d2c61000130
updated: 2010-11-30T21:43:38-05:00
date: 2008-10-22T00:18:00-04:00
tags:
- code
redirect_from: /blog/archives/2008/10/22/push-upstream/
---

Scenario 1: You're half way through a really productive day on a wicked new feature for an app and everything is going smoothly. Then, from out of nowhere…SMACK! A nasty bug in a library you depend on splatters right in your face. "Seriously, nobody has come across this before?" you mumble.

Scenario 2: You're using some fancy library and you think to yourself, "Geez, wouldn't it be sweet if it did *&lt;insert fancy feature here&gt;* for you?"

The temptation, especially with Ruby, is to solve both of these problems in your app's code base by modifying your copy of the library. This may seem like the path of least resistance and the quickest way to move forward in the short term, but in the long term all you are doing is delaying the cost of properly solving that problem. You are incurring debt, which over time compounds and will end up costing you more to fix.

First, when you're making the change just for yourself, you're less likely to solve the problem properly or do the appropriate testing. You'll do some hack job for the problem you have, without considering how it might affect other scenarios.

Second, if you found a bug or have a desired feature, chances are that someone else has or will run into the same situation. Fixing it locally doesn't help everyone else.

Lastly, fixing the bug or adding a new feature directly in your app makes it nearly impossible to upgrade the library. I spent over 4 hours this week trying to upgrade an open source app to the latest version of Ruby on Rails, and still have over 100 failing tests. The biggest problem isn't Rails itself, but all the plugins that also need upgraded, many of which had been patched in some form.

At Collective Idea, we use git submodules for as many external libraries as possible. While submodules have their own issues, and probably aren't a recommended approach, the positive side-effect is that it strongly discourages us from patching libraries in place. If we do need to make a change, each library is already its own git repository, so we can push our changes and send a pull request to the original maintainer.

If you need to modify an open source library, don't just do it in place. Push your changes upstream. Irresponsible patching hurts us all.
