---

title: "What's wrong with Cucumber"
id: 4eaffa7bdabe9d2be6010f76
updated: 2012-05-28T11:17:09-04:00
date: 2012-05-28T09:00:00-04:00
tags:
- code
redirect_from: /blog/archives/2012/05/28/whats-wrong-with-cucumber/
---

*This post has sat as a draft on my computer for well over a year now. I always intended to finish it, but am beyond caring. So I'm just going to publish it in its current form in hopes that it sparks some interesting conversation and avoids beating a dead horse.*

[Cucumber](http://cukes.info) is a divisive tool. Some people absolutely love it and have an irrational dedication to using it for every single project. Others hate it, either because they haven't tried it, or tried it on one project and ended up with a steaming pile of <del>sh</del>…step definitions.

I've been using cucumber since one of the first few releases. While I have been burned by it on projects, I also have a great appreciation for it.

What's wrong with cucumber? Technically, nothing. It's a brilliant tool for creating DSLs to test our applications. **The problem with cucumber is YOU**: you don't understand **why** to use it, **when** to use it or **how** to use it. Don't worry, though, it's not entirely your fault. Many people are responsible for encouraging you to use it in asinine ways and advertising it as a magical medical formula that will cure all your woes.

Why: understand the purpose
---------------------------

Cucumber is a tool for creating executable feature specifications, a.k.a acceptance tests. We write these tests to ensure that we have working code that meets our requirements. If the tests don't help achieve that, then **don't write them**. For this reason, I rarely write Rails controller tests anymore.

Fairly or not, many have this misconception that you should write your acceptance tests in plain text so that your client or stakeholders can read and write them. It is highly likely that your **stakeholders won't care about cucumber features**. They probably won't read them, and they almost surely won't write them.

You should use cucumber because it's a great tool for giving you a vocabulary to think and talk about how your application should work. As a programmer and perfectionist, I easily get mired in the implementation details and forget that the software I'm writing is actually supposed to do something useful. Driving a feature with cucumber helps me first think though how it should actually work and then guides me through implementing it. It keeps me focused on writing the minimal amount of code to make the software work.

Use Cucumber if it will directly help translate required features into working code. If the person doing the programming doesn't find it helpful, then don't use it!

When: you don't always need a DSL
---------------------------------

Cucumber is a DSL for creating a DSL for writing acceptance tests. With me so far? In other words, Cucumber helps you create a vocabulary to describe how your application should work.

Some apps require a DSL to describe their behavior, but many don't. For a large business application with lots of rules and complicated logic, creating a DSL is the only maintainable way to test it. Testing a simple web API is really a lot quicker and easier with RSpec or Test::Unit.

The advantage of using Cucumber over a plain ol' testing framework is that it forces you to use a limited vocabulary to describe your application. If your application requires an expansive vocabulary to describe its functionality, then don't use Cucumber

How: the ivory tower
--------------------

I don't think people understand **why** and **when** to use Cucumber. But what prompted me to write this post is the recent debate over the [removal of web\_steps.rb](http://aslakhellesoy.com/post/11055981222/the-training-wheels-came-off), and that brings us to **how**.

One of the challenges of a programmer is to find the highest level of abstraction that makes sense. Code with too little abstraction is littered with duplication and is too complex to fit in your head. Code that is abstracted too much is too rigid and cumbersome to use. An abstraction should capture only the details that are relevant for the task at hand.

For many apps, the web interface is the right level of abstraction for describing its functionality.

*Cliffhanger: this is the state in which I left this article. I've [created a gist for this article](https://gist.github.com/2819565), so if you'd like to finish making the argument, fork the gist and link to your version in the comments.*
