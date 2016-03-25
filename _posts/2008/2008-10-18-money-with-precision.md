---

title: "Money with precision"
id: 4cf5b65adabe9d2c61000137
updated: 2010-11-30T21:43:39-05:00
date: 2008-10-18T16:26:00-04:00
tags:
- code
redirect_from: /blog/archives/2008/10/18/money-with-precision/
---

I've been working on a project that needs to store mileage reimbursement rates to the nearest tenth of a cent. We were using the `money` gem, which stores money amounts in cents, so it looked like it was going to be a pain.

But without too much suffering, I [modified the money gem](http://github.com/collectiveidea/money) to take a precision (in powers of 10), which defaults to 2. It can now store amounts in any precision.

{% highlight ruby %}
>> amount = 20.to_money + 0.505.to_money
=> #<Money @precision=3, @currency="USD", @cents=20505>
>> amount.to_s
=> "20.505"
>> amount.format
=> "$20.51"
{% endhighlight %}

You can also store amounts in negative precisions, like millions:

{% highlight ruby %}
>> amount = Money.new(50, 'USD', -6)
>> amount.to_s
=> "50"
>> amount.format
=> "$50000000.00"
{% endhighlight %}

Check out our [fork of the money gem on github](http://github.com/collectiveidea/money). There are lots of other goodies in there.
