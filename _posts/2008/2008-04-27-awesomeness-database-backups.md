---

title: "Awesomeness: database backups"
id: 4cf5b661dabe9d2c610001e0
updated: 2010-11-30T21:43:45-05:00
date: 2008-04-27T18:09:00-04:00
tags:
- code
redirect_from: /blog/archives/2008/04/27/awesomeness-database-backups/
---

At [Collective Idea](http://collectiveidea.com), we have a plugin called [awesomeness](http://github.com/collectiveidea/awesomeness) that is…well, awesome. It's a collection of things that we use in almost every project that aren't generic enough to go into individual plugins (although some things may have evolved enough to be worthy of plugin status).

A while ago, I [blogged a little snippet for backing up your remote database](/2007/2/9/automatically-backing-up-your-remote-database-on-deploy). Well, that snippet as evolved quite a bit, into it's own set of rake and Capistrano tasks.

First, the rake tasks. You Can easily create a new local backup:

$ rake db:backup:create

This creates a `backups` directory in your project, with a subdirectory for each backup based on the timestamp. A backup consists of the `schema.rb` file and then a fixture for each table to hold the data. Why fixtures? Good question. Because we wanted the backups to be database independent.

You can easily restore your local database to the latest backup, or a specific version:

$ rake db:backup:restore VERSION=20080427214315

That's nice, but what good are local backups? That's where Capistrano comes in. Just add this to your `config/deploy.rb`:

load 'awesomeness/backup'

This adds some nifty remote backup support. Now, whenever `cap deploy:migrations` is run, a backup of your remote database will automagically be created and stored in the shared directory on the server. You can also have them transferred to your local machine by adding a callback in your `deploy.rb`:

after "backup:create", "backup:download"

Sometimes, you just want to take a snapshot of the server and plop it into your local database.

$ cap backup:mirror

### How do I get this backup awesomeness?

[Awesomeness now lives on Github](http://github.com/collectiveidea/awesomeness/tree/master) (like the rest of the world). Fork it and let us know what you think.
