---

title: "Splitting Hairs and Arrays"
id: 4cf5b660dabe9d2c6100019e
updated: 2010-11-30T21:43:44-05:00
date: 2008-06-19T19:05:00-04:00
tags:
- code
redirect_from: /blog/archives/2008/06/19/splitting-hairs-and-arrays/
---

Am I just dumb, or is it really a lot harder than it should be to break an array up into a set number of chunks?

For example, I have a list of 8 items that I want to break into 3 arrays, each displayed in their own unordered list, like this:

<div style="overflow:hidden;">
<ul style="float: left; margin-left: 3em">
<li>
Item 1

</li>
<li>
Item 2

</li>
<li>
Item 3

</li>
</ul>
<ul style="float: left; margin-left: 3em">
<li>
Item 4

</li>
<li>
Item 5

</li>
<li>
Item 6

</li>
</ul>
<ul style="float: left; margin-left: 3em">
<li>
Item 7

</li>
<li>
Item 8

</li>
</ul>
</div>
[Brian](http://ryckbost.com) and I spent a ridiculous amount of time (20 minutes, at least) trying to come up with a clean solution to this seemingly simple problem. The closest thing there is to a solution is [Enumerable\#each\_slice](http://ruby-doc.org/core/classes/Enumerable.html#M001129) in Ruby core or [Array\#in\_groups\_of](http://api.rubyonrails.org/classes/ActiveSupport/CoreExtensions/Array/Grouping.html#M000275) in Active Support.

{% highlight erb %}
<% my_array.each_slice((my_array.size.to_f / 3).ceil) do |list| %>
  <ul>
    <% list.each do |item| %>
      <li><%= item %></li>
    <% end %>
  </ul>
<% end %>
{% endhighlight %}

or

{% highlight erb %}
<% my_array.in_groups_of((my_array.size.to_f / 3).ceil, false) do |list| %>
  <ul>
    <% list.each do |item| %>
      <li><%= item %></li>
    <% end %>
  </ul>
<% end %>
{% endhighlight %}

There's not really a difference between either solution. Both requires that we calculate how many items we want in each list. (We convert the size to a float, divide by the number of columns, then round up. This gives us the same number of items in each column, with the last column having fewer.)

<h3>
Our solution

</h3>
We didn't like having that much logic in the view, so we added a method to enumerable; we thought the division (`/`) method seemed appropriate since we're dividing the array into equal parts.

{% highlight ruby %}
module Enumerable
  # Divide into groups
  def /(num)
    returning [] do |result|
      each_slice((size.to_f / num).ceil) {|a| result << a }
    end
  end
end
{% endhighlight %}

> Note: this method is now in our [awesomeness](http://github.com/collectiveidea/awesomeness) plugin.

So now we can just divide our array into chunks in the view.

{% highlight erb %}
<% (my_array / 3).each do |list| %>
  <ul>
    <% list.each do |item| %>
      <li><%= item %></li>
    <% end %>
  </ul>
<% end %>
{% endhighlight %}

Are we dumb? Is there already a way to do this that wasn't obvious to us and we just wasted our time (and I wasted even more time blogging about it)?

<p>
<ins>
Update: Thanks to Aaron Pfeifer for pointing out the [discussion on Jay Field's blog](http://blog.jayfields.com/2007/09/ruby-arraychunk.html) about something similar. I've refactored this code in [awesomeness](http://github.com/collectiveidea/awesomeness/tree/master/lib/awesomeness/core_ext/enumerable.rb) to be more "robust' (read: convoluted).</ins>

</p>
