---

title: "My First Rails Core Contribution"
id: 4cf5b680dabe9d2c610005c8
updated: 2010-11-30T21:44:16-05:00
date: 2006-09-16T04:32:00-04:00
tags:
- life
redirect_from: /blog/archives/2006/09/16/my-first-rails-core-contribution/
---

<p>
After spending the better part of the day trying to figure out why my .rpdf template handler was generating blank PDFs yesterday, only to realize that it was trying to render them inside the default HTML layout, I submitted a <a href="http://dev.rubyonrails.org/ticket/6219">small patch to the Rails Trac</a> to allow other file extensions&mdash;in addition to .rjs&mdash;to be exempt from being rendered in the layout. Having submitted other patches in the past, I fully expected this patch to be ignored for a few months, or indefinitely.

</p>
<p>
But to my surprise, I opened up my news reader this morning to find <a href="http://dev.rubyonrails.org/changeset/5126">changeset 5126: Declare file extensions exempt from layouts.</a>

</p>
