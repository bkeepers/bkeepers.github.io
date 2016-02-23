---
layout: post
title: "acts_as_audited"
id: 4cf5b681dabe9d2c610006b3
updated: 2012-06-05T10:31:20-04:00
date: 2006-07-21T04:00:00-04:00
tags:
- popular
- code
redirect_from: /blog/archives/2006/07/21/acts_as_audited/
---

***NOTE:** This article is out of date. Visit the [project on Github](http://github.com/collectiveidea/acts_as_audited) or the [mailing list](http://groups.google.com/group/acts_as_audited) for up-to-date information.*

<code>acts\_as\_audited</code> is an Active Record plugin that logs all modifications to your models in an <code>audits</code> table. It uses a polymorphic association to store an audit record for any of the model objects that you wish to have audited. The audit log stores the model that the change was on, the "action" (create, update, destroy), a serialzied hash of the changes, and optionally the user that performed the action.

### Auditing in Rails

If you're using acts\_as\_audited within Rails, you can simply declare which models should be audited. acts\_as\_audited can also automatically record the user that made the change if your controller has a <code>current\_user</code> method.

{% highlight ruby %}
class ApplicationController < ActionController::Base
  audit User, List, Item
protected
  def current_user
    @user ||= User.find(session[:user])
  end
end
{% endhighlight %}

### Customizing

To get auditing outside of Rails, or to customize which fields are audited within Rails, you can explicitly declare <code>acts\_as\_audited</code> on your models. The <code>:except</code> option allows you to specify one or more attributes that you don't want to be saved in the audit log.

{% highlight ruby %}
class User < ActiveRecord::Base
  acts_as_audited :except => [:password, :credit_card_number]
end
{% endhighlight %}

### Installation

You can grab the plugin by running:

    script/plugin install git://github.com/collectiveidea/acts_as_audited.git

Run the migration generator and migrate to add the audits table.

    script/generate audited_migration add_audits_table
    rake db:migrate

### Upgrading

Those upgrading from version 0.2 need to add 2 fields the audits table:

{% highlight ruby %}
add_column :audits, :user_type, :string
add_column :audits, :username, :string
{% endhighlight %}
