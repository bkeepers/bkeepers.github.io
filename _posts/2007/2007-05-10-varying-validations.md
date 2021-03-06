---

title: "Varying validations"
id: 4cf5b671dabe9d2c610003aa
updated: 2010-11-30T21:44:01-05:00
date: 2007-05-10T00:03:00-04:00
tags:
- code
redirect_from: /blog/archives/2007/05/10/varying-validations/
---

As great as Rails validations are, they've left much to be desired for me. I find that I often want to only do partial validations, or use a different set of validations on my model based on who is creating it (admins should be trusted more than visitors) or where it is being created (creating a user on the command line or automated process shouldn't require acceptance of terms or confirmation of a password).

I'm getting close to the point where I'm so annoyed about this problem that I'm ready to solve it, but I can't quite figure out the best way to do it. So, I ask you, how do we remedy this?

Here are a couple ideas that I've had for changing how validations work.

### Fatter model

My first thought is to just add it to the model by declaring "sets" of validations:

{% highlight ruby %}
class User < ActiveRecord::Base
  validations :terms do
    validates_acceptance_of :terms, :privacy_policy
  end
  validations :confirmation do
    validates_confirmation_of :password
  end
end
{% endhighlight %}

And then when you save a model, you can specify what sets to use.

{% highlight ruby %}
user = User.new(params[:user])
user.valid?(:terms, :confirmation)
user.save(:terms, :conditions)
# or all, possibly the default
user.save(:all)
{% endhighlight %}

I could also see this being used for a wizard like interface.

{% highlight ruby %}
class Foo < ActiveRecord::Base
  validations :step1 do
    validates_presence_of :name, :stuff, :thing
  end
  validations :step2 do
    validates_presence_of :bar, :baz
    validates_acceptance_of :terms
  end
  validations :step3 do
    validates_confirmation_of :password
  end
end
{% endhighlight %}

### But that shouldn't really be part of the model

You're right, these problems really don't concern the model. The model shouldn't care were it is being created from, or if it's being created in one step or five. So what about going to the opposite end of the spectrum, and completely removing validations from the model and declaring them in observer-like classes.

{% highlight ruby %}
class TermsValidation < ActiveRecord::Validations
  validate :user, :supplier

  validates_acceptance_of :terms, :privacy_policy, :on => :create
end

class Step1Validation < ActiveRecord::Validations
  validate :foo

  validates_presence_of :name, :stuff, :thing
end
{% endhighlight %}

And then in the controller:

{% highlight ruby %}
class UsersController < ActionController::Base
  validate :terms

  def create
    user = User.new(params[:user])
    if user.save
      # all the validations passed
    else
      # a validation failed, handle just like you would normally
    end
  end
end
{% endhighlight %}

If we had an action that required different validations than the rest of the controller, we could also use similar approach to what we talked about earlier and declare what validations to use:

{% highlight ruby %}
class UsersController < ActionController::Base
  validate :terms

  def update
    user = User.find(params[:id])
    user.update_attributes(params[:user], :step2)
  end
end
{% endhighlight %}

I like this better, because choosing what set of validations to use does seem more like a controller decision, and not model one, but it is the model's responsibility to make sure that the data is "valid", so how do we reconcile this?

How are you working around this problem? Is there an obvious solution that I'm just not seeing?
