---

title: "Validation Anti-Pattern"
id: 4db8db0fdabe9d3eee000001
updated: 2011-12-09T10:28:10-05:00
date: 2011-04-27T23:00:00-04:00
tags:
- popular
- code
redirect_from: /blog/archives/2011/04/27/validation-anti-pattern/
---

Validations in ActiveRecord and other mapping frameworks are used to ensure that the data being saved to the database meets the requirements of the app. More importantly, validations are used to communicate to the end user what they need to change about the data they entered.

I often see people using validations to check generated attributes or an attribute set by the controller, and I think that is wrong. **Validations should only be used if you to provide your user an opportunity to correct the invalid data**.

For example, take this [MongoMapper](http://mongomapper.com) model:

{% highlight ruby %}
class ChatMessage
  include MongoMapper::Document

  key :text, String
  key :game_id, ObjectId

  belongs_to :game

  validates_presence_of :text, :game_id
end
{% endhighlight %}

This model is created in an action that looks something like this:

{% highlight ruby %}
def create
  @game = current_user.games.find(params[:game_id])
  @chat_message = @game.chat_messages.build(params[:chat_message])
  if @chat_message.save
    redirect_to @game
  else
    render :edit
  end
end
{% endhighlight %}

The model is validating the presence of `text`, a value supplied by the user, and `game_id`. The only way that `game_id` can be blank is if there is something wrong the your controller logic. In that unlikely case, your user will be presented with the completely unhelpful error: **Game cannot be blank**. `game_id` should not be a validation that is shown to your user.

But I don't want to save invalid data!
--------------------------------------

That's fine. You can still use the validation callback as an opportunity to verify the data. Add an assertion that the attribute is set. Just don't add validation errors that get displayed to your user, because no matter what they do, they won't be able to fix the error that they are seeing. It is more helpful to raise an exception, which will show your user the standard 500 error, and notify you that you've got a problem with your application logic.

{% highlight ruby %}
validate :validate_game_id

def validate_game_id
  raise "game_id must be present" unless self.game_id?
end
{% endhighlight %}

But what about people hacking?
------------------------------

Do you really want to return friendly error messages to someone trying to hack your app? When trying to secure your app, you want to expose as little information as possible to potential attackers. That's why it's even more important to raise errors when validating internal data.

Return friendly error messages for values supplied by your user, and raise big ugly errors when things go wrong.
