---
title: Truck Factor
layout: post
tags:
- opensource
- link
link: http://mtov.github.io/Truck-Factor/
---

[@mtov](https://github.com/mtov) posts on the "[Truck Factor](http://mtov.github.io/Truck-Factor/)"—the minimal number of developers that have to be hit by a truck before a project is incapacitated—of open source projects on GitHub.

> To calculate the truck factor, we use a greedy heuristic: we consecutively remove the author with more authored files in a system, until more than 50% of the system's files are orphans (i.e., without author). We are considering that a system is in trouble if more than 50% of its files are orphans.

He calculated the Truck Factor on 133 popular GitHub repositories in six languages.

> Our results are summarized as follows:
>
> - Most systems have a small truck factor:
>   - 61 systems have TF=1 (46%), including systems like mbostock/d3, and clojure/clojure.
>   - 37 systems have TF=2 (28%), including systems like cucumber/cucumber, mrdoob/three.js, mozilla/pdf.js, spring-projects/spring-framework.
> - The two systems with the highest Truck Factor are torvalds/linux (TF = 90) and Homebrew/homebrew (TF = 159).
