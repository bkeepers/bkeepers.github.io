---

title: "The importance of var in JavaScript"
id: 4cf5b65cdabe9d2c6100014e
updated: 2010-11-30T21:43:40-05:00
date: 2008-09-03T20:37:00-04:00
tags:
- code
redirect_from: /blog/archives/2008/09/03/the-importance-of-var-in-javascript/
---

I would consider myself proficient at JavaScript. Not a rockstar, but I can hold my own. But I didn't learn it out of a book; I picked it up slowly over several years. So occasionally I come across something that I probably would have learned in the first couple chapters of a decent JavaScript book.

Today, I experienced the importance of declaring variables with `var`.

For the unenlightened like myself, JavaScript basically has two scopes for variables: global and local. Variables assigned outside of a function are global, and variables assigned inside of a function, using the `var` keyword, are local (not rocket surgery). However, if you leave the `var` keyword off, it assigns a global variable, regardless of where it's declared.

Here's a bit of code that demonstrates this:

{% highlight javascript %}
function fail() {
  date = new Date();
  console.log('Before: ' + Number(date));
  setTimeout(function() {
    console.log('After: ' + Number(date));
  }, 1000);
}

fail();
fail();
{% endhighlight %}

The code defines a function that sets a variable, logs the variable, then defines a callback that logs the variable again on second later. If you call the function twice in a row, you can see the effect:

    Before: 1220487263486
    Before: 1220487263499
    After: 1220487263499 <- This should be 1220487263486
    After: 1220487263499

Declaring the `date` variable with `var` gives us this output:

    Before: 1220487287985
    Before: 1220487287994
    After: 1220487287985 <- see, this is the same as the first line
    After: 1220487287994

So remember kids, declare local variables with `var`!
