---

title: "Should there be an official Rails manual?"
id: 4cf5b67ddabe9d2c61000525
updated: 2010-11-30T21:44:13-05:00
date: 2006-12-03T00:44:00-05:00
tags:
- code
redirect_from: /blog/archives/2006/12/03/should-there-be-an-official-rails-manual/
---

One of the biggest problems with documentation, especially in active community projects like Rails, is that it becomes outdated so quickly. Thus, we have tools like RDoc, which allow us to put documentation inline with the code. This makes a great API reference, but it isn't always that helpful when learning the features of the framework.

When the fine folks at Caboo.se announced their [drive to raise funds for Rails documentation](http://blog.caboo.se/pages/documentation_drive), I was really hopeful that the result would be an "official" Rails manual. I suggested it on their [wiki](http://caboose.stikipad.com/documentation/), and several people commented that it would be a good idea, but there didn't seem to be a lot of public conversation about it (at least, not out side of \#caboose). It seems so far that the Caboo.se documentation effort is primarily focused on the Rails RDoc.

Currently, the best resource for understanding Rails features are individual blogs. While this is good for bloggers, it is a pain for users. For example, yesterday I was trying to figure out all the things you can do with generators. The best resources I found on the subject were mini howtos on random blogs.

Several of the (Java) frameworks that I have used in the past have had an official manual, and although it was very dry (not the good kind of <acronym title="Don't Repeat Yourself">DRY</acronym>), it was a great resource. The [Spring framework](http://static.springframework.org/spring/docs/2.0.x/reference/index.html) and [Hibernate](http://www.hibernate.org/hib_docs/v3/reference/en/html/) both have excellent reference manuals.

I think that we need an official Rails reference manual: in-depth coverage of all the features of the Rails framework organized into a table of contents with an index.

One could argue that we don't need a manual because of wonderful books like [Agile Web Development with Rails](http://pragmaticprogrammer.com/titles/rails2/index.html), [Ruby for Rails](http://www.manning.com/black/), [Rails Recipes](http://pragmaticprogrammer.com/titles/fr_rr/index.html), etc. While these books are definitely helpful, they suffer from the problem of quickly becoming outdated (thus the need for a 2nd edition of AWDWR in just over a year). The community moves too fast to keep RDoc up to date, and the publishing industry, by nature, is simply slow. And for the most part, the books are a skin-deep overview of the most important features, not a reference manual.

One could also argue that this would hurt the publishers, but I don't think it would. A reference manual is a lot different from a book. A reference manual, while potentially helpful for beginners, would be of more value for intermediate (and maybe even advanced) users. There would still be plenty of room for books targeted at beginners, and could open up a market for more advanced books on specific topics.

### What should a manual look like?

One possibility is to treat it with the same respect as the Rails source code: put it under version control and file bug reports and patches for it. The advantage of this approach is that the documentation is versioned. There can be manuals for each release of the framework without having to duplicate efforts. Fixes can be merged into all versions of the manual. You could encourage (force) patch submissions for the framework to include documentation updates. The down side is that documentation would have to be written in something like DocBook (yuck), which would limit it to more tech-savvy authors.

The next option is a wiki. This [has been tried](http://wiki.rubyonrails.org) and has turned into a jumbled, nearly useless mess. The wiki would require organization and a hierarchy. A wiki approach would make it easier for anyone to contribute. The down side is that there is only one version of documentation. It makes it harder to keep it up to date as Rails progresses.

A third option is to write something that combines the best of the previous two. A wiki interface to versioned documentation. This is sort of what Caboo.se is trying to do with RDoc. The wiki could either tie directly into subversion, or generate patches that could be submitted to a documentation team.

### Who's going to write it?

Well, we are. The are open source projects out there that have proven that good documentation is possible. You just have to be very intentional and disciplined.

To start with, we could just take existing blog entries, with the author's permission, and compile them into a form of a "manual". Then, proceed to make it more cohesive. We could also possibly pull in the parts of the Rails RDoc like the intro to [ActiveRecord::Base](http://api.rubyonrails.org/classes/ActiveRecord/Base.html), since that information is really more reference material than API documentation.

After that, the core team needs to be more adamant about requiring documentation with patches, and the community needs to step it up.

### Thoughts?

What do you think? Is this truly a need of the community, or is it just something I long for?
