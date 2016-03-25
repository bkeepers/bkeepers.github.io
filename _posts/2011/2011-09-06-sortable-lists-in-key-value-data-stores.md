---

title: "Sortable lists in key-value data stores"
id: 4e66386edabe9d3ad000017b
updated: 2011-09-06T12:43:45-04:00
date: 2011-09-06T11:13:00-04:00
tags:
- code
redirect_from: /blog/archives/2011/09/06/sortable-lists-in-key-value-data-stores/
---

Note: This post contains illustrations that may not appear properly in your feed reader. You may want to view the original post in your browser

Last week I [blogged about using Git as a key-value database](http://opensoul.org/blog/archives/2011/09/01/git-the-nosql-database/) as I experiment with using Git as a database backend for an application.

One of the first challenges I encountered is not unique to Git, but to key-value stores in general; allowing users to **manually sort** a list of items without the niceties of atomic operations.

The most common way to allow users to manually sort a list is simply to store a **position** along with each record. When the user reorders the records, then you update the position on each record. This works well as long as the data set is small and there are guards in place to prevent two users from sorting at the same time.

However, with large amounts of data or a data store that doesn't support atomic operations on multiple records, this **doesn't scale well**. And specific to Git, updating every single record pretty much guarantees a merge conflict when the Git repos are pushed to a common origin.

I needed a simple way to create a manually sortable list that avoided merge conflicts. Preferably, a manual reorder would only update the one record whose order changed, and leave the others untouched.

Floats between 0 and 1
----------------------

The solution I arrived at is to specify order as a float between 0 and 1. When you move an item, it's position becomes a float that is half-way between the item before and the item after it. Items moved to the top of the list will get closer and closer to 0, and items to the bottom of the list get closer to 1.

Let me illustrate with some examples. The first item added to the list will get a position of **0.5**, half-way between **0** and **1**.

<div class="example">
<ul>
<li>
Item A
<span class="position">position: 0.5</span>

</li>
</ul>
</div>
The second item added will be half-way between the last item, **0.5**, and **1**.

<div class="example">
<ul>
<li class="previous">
Item A <span class="position">position: 0.5</span>

</li>
<li>
Item B <span class="position">position: 0.75</span>

</li>
</ul>
</div>
The third item added will be half-way between the last item, **0.75**, and **1**.

<div class="example">
<ul>
<li class="previous">
Item A <span class="position">position: 0.5</span>

</li>
<li class="previous">
Item B <span class="position">position: 0.75</span>

</li>
<li>
Item C <span class="position">position: 0.875</span>

</li>
</ul>
</div>
Now, if the user wanted to move **Item C** in between **Item A** and **Item B**, then its new position would be half way between the position of the item before and after it.

<div class="example">
<ul>
<li class="previous">
Item A <span class="position">position: 0.5</span>

</li>
<li>
Item C <span class="position">position: 0.625</span>

</li>
<li class="previous">
Item B <span class="position">position: 0.75</span>

</li>
</ul>
</div>
If the user wanted to move **Item B** to the top of the list, then its new position would be half way between the first item in the list and 0.

<div class="example">
<ul>
<li>
Item B <span class="position">position: 0.25</span>

</li>
<li class="previous">
Item A <span class="position">position: 0.5</span>

</li>
<li class="previous">
Item C <span class="position">position: 0.625</span>

</li>
</ul>
</div>
And so on and so on…

This solution allows the user to reorder items without updating every record in the data store. As more items get added to the list and moved around, the position just becomes more and more precise. There is a theoretical limit to the number of times items can be moved, but it is very high.

<style>
  .feedreader {
    display:none;
  }
  .example {
    padding: 1.5em;
  }
  .example ul {
    margin:0;
    list-style:none;
    top:0;
  }
  .example li {
    margin: 1em;
    padding: 1em 2em;
    background: #EEE;
    background: -webkit-linear-gradient(#EEE, #DDD 80%);
    -webkit-box-shadow: 0px 1px 3px rgba(0,0,0,0.3);
    -webkit-border-radius: 5px;
   font-weight: bold;
  }
  .example li .position {
    display: inline-block;
    float: right;
    font-weight:normal;
    font-size:0.9em;
    width: 90px;
  }
  .example li.previous {
    opacity: 0.5;
  }
</style>
