---

title: "Fixed in edge rails: table name quoting"
id: 4cf5b667dabe9d2c61000273
updated: 2010-11-30T21:43:51-05:00
date: 2007-10-16T10:00:00-04:00
tags:
- code
redirect_from: /blog/archives/2007/10/16/fixed-in-edge-rails-table-name-quoting/
---

One of more [annoying ActiveRecord bugs](http://dev.rubyonrails.org/ticket/4593) has finally been [fixed in edge rails](http://dev.rubyonrails.org/changeset/7932) after 2 years. Table names in SQL queries are now properly escaped.

On nearly every project it seems I end up having a table name that doesn't work in either MySQL or sqlite. While they usually are SQL reserved words, most databases allow you to use reserved words if they're properly quoted.

The following, which doesn't work in MySQL:

    DELETE FROM values;

will now be:

    DELETE FROM `values`;
