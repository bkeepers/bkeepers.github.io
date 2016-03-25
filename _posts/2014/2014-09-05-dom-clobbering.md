---
title: User-generated content and DOM clobbering

tags:
- code
---

The web lives and dies by the [DOM](https://developer.mozilla.org/en-US/docs/DOM). It is both a beautiful and horrible thing. Here is just one example; it's called _"DOM clobbering"_.

Say you have a site, like [GitHub.com](https://github.com), that allows users to place [whatever content they want](https://help.github.com/articles/github-flavored-markdown) on it. You want to be a hospitable host of that content, so you try to make it as feature-ful as possible. For example, if the content includes an `h1` tag, you want to add anchors so anyone can link directly to that header.

There are two ways that browsers support deep-linking to content:

1. An `id` attribute on any tag.
1. an `a` tag with a `name` attribute.

```html
<h1 id="problem">The Problem</h1>

<h1><a name="solution">The Solution</a></h1>
```

With either method, users can link to [#problem](#problem) and the browser will scroll down to that heading. Ok, we all know how links work, so what's the big deal?

## <a id="problem"></a> The Problem

`id` is used by both JavaScript and CSS. Allowing users to create content with arbitrary `id` attributes means that they could intentionally or unintentionally break functional or styles. So our first option for deep-linking is out. Good thing we have a second option.

Unfortunately, there's this really uncool interaction between HTML and the DOM where elements with a `name` attribute are assigned to variables on `document`. Early cave dwellers would use this "feature" to quickly gain access to form elements, but this appendix hasn't been needed since the advent of [HTML 4.01](http://www.w3.org/TR/DOM-Level-2-HTML/html.html#ID-71555259) when `document.getElementsByName` was introduced.

But, what's the harm in leaving this feature around? Somebody might still find it useful.

```html
<a name="addEventListener">Oh, you wanted to bind events?</a>
```

Consider your DOM clobbered.

Now I know what you're thinking: "Browsers wouldn't  override existing properties like `document.addEventListener`, would they?". I know, I had the same thought! I don't want to name names, but certain non-webkit-based browsers may disappoint you.

Neither option allows us to deep-link to content without the possibility of interfering with the rest of the site.

## <a id="solution"></a> The Solution

Prefix every `id` and `name` attribute coming from a user with `user-content-`, and use JavaScript to preserve the browser's scroll on the `hashchange` event. So…

```html
<a name="addEventListener"></a>
```

…gets rewritten to…

```html
<a name="user-content-addEventListener"></a>
```

And then we use this CoffeeScript to preserve the browser's behavior of scrolling to the hash.

```coffeescript
jQuery(window).on 'hashchange', (event) ->
  # We don't need to do anything if there is no hash.
  return unless location.hash

  # We don't need to do anything if the current target exists
  return if document.querySelector(":target")

  # See if a user-content-* element exists and scroll to it
  name = "user-content-#{location.hash.slice(1)}"
  target = document.getElementById(name) ||
    document.getElementsByName(name)
  $(target).scrollTo()
```

Using JavaScript to mimic the browser's native behavior is usually not ideal. If browsers supported a way to deep-link to content that didn't have a negative impact on other DOM features, then we wouldn't even have to worry about it. But they don't.

We've been using this method on GitHub.com for a few months now without any noticeable impact.
