---

title: "Hack for partial matches in Ferret"
id: 4cf5b667dabe9d2c6100024d
updated: 2010-11-30T21:43:51-05:00
date: 2007-12-12T13:02:00-05:00
tags:
- code
redirect_from: /blog/archives/2007/12/12/hack-for-partial-matches-in-ferret/
---

I love [ferret](http://ferret.davebalmain.com/trac/) (the ruby port of Lucene, not the fuzzy little creatures, you sicko). But something I fight on every project is that ferret turns into a bear when you try to get it to do partial matches, like `"ferr"` matching `"ferret"` and `"ferrari"`.

Ferret allows you to append an asterisk to your search query (`"ferr*"`), which works great, but we can't expect our users to do that because damn Google <sup>[1](#google)</sup> has set the expectation that search just works; I don't need to use any funky syntax to find my pogs, Harry Potter gossip or BRATZ <sup>[2](#normalusers)</sup>.

So, we can do this manually in code by appending an asterisk to anything users enter and problem solved, right? Not quite.

-   It breaks if you're using the StemFilter, which allows you to match variations of words (`"happy"` would match `"happiness"` and `"happiest"`)
-   It will only match partials on the last word that the user entered (`"Ed Brad"` won't find `"Edward Bradley"`)
-   Apparently the asterisk tells ferret that there has to be more characters, because full matches no longer work (`"ferret*"` won't match `"ferret"`)

So, here's my hack.

{% highlight ruby %}
Book.find_by_contents "(#{term})^2 OR (#{term.split.map {|t| t + "*" }.join(' ')})"
{% endhighlight %}

This ugly little thing will match exactly what the user entered (making use of stemming and all the magic that comes from it) and give it a little boost in the ranking, or match any part of any of the words entered, giving me partial matches.

I acknowledge that this is an ugly hack at the moment, and will break miserably if the user is any kind of a wizard that knows how to do advanced searches, but it works for now. I have no idea what kind of consequences this will have as far as search performance and such. The goal is to wrap this into a filter.

Any one else have any cleaver ideas for doing partial matches?

<ol class="footnotes">
<li id="google">
Yes, Google, we love and hate you for raising the bar.

</li>
<li id="normalusers">
We're talking normal users here, which excludes anyone that is reading this.

</li>
</ol>
