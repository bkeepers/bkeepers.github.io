---

title: "RPMs for Deploying Rails on CentOS"
id: 4cf5b681dabe9d2c61000605
updated: 2010-11-30T21:44:17-05:00
date: 2006-08-02T19:43:00-04:00
tags:
- code
redirect_from: /blog/archives/2006/08/02/rpms-for-deploying-rails-on-centos/
---

<p>
Thanks to <a href="http://mongrel.rubyforge.org/">mongrel</a>, Ruby on Rails deployment is finally decent. Several weeks back I switched all of our servers over to using Apache 2.2 with mod\_proxy\_balancer, mongrel and mongrel\_cluster, and I haven't had any problems.

</p>
<p>
Unfortunately, since most of our servers run <a href="http://www.centos.org">CentOS</a> (repackaged RedHat Enterprise Server 4), the setup isn't as easy as it could be since it ships with Apache 2.0 and ruby 1.8.2, which doesn't work with Rails. So I've rebuilt all the necessary RPMs (and more) and <a href="http://source.collectiveidea.com/pub/linux/centos/4/i386">made them available</a> to make deploying a snap. <em>Note: these packages <strong>should</strong> also work on RedHat Enterprise Linux 4, however, I have not tested them.</em>

</p>
<h3>
Yum configuration

</h3>
<p>
<a href="http://source.collectiveidea.com/pub/linux/centos/4/i386/ci.repo" title="[i] Collective Idea yum configuration file for CentOS 4">Download</a> or create the yum config in <code>/etc/yum.repos.d/</code> file with the following contents:

</p>
    [ci]
    name=[i] Collective Idea RPM Repository
    baseurl=http://source.collectiveidea.com/pub/linux/centos/4/i386
    gpgcheck=1
    enabled=1
    gpgkey=http://source.collectiveidea.com/pub//RPM-GPG-KEY

<h3>
Install Packages

</h3>
<p>
To install the packages, run:

</p>
    yum install httpd ruby ruby-devel rubygems ri

<blockquote>
Note: If you already have Apache and other modules installed, this command may fail. You can try running <code>yum upgrade</code>, or you may just need to remove the packages before you install the new packages. If you're using any packages, such as other Apache modules, that I haven't rebuilt against Apache 2.2, let me know and I can add them.

</blockquote>
<h3>
Install Gems

</h3>
<p>
Install the gems you need by running:

</p>
    gem install -y rails mongrel mongrel_cluster

<h3>
Configure Apache and Mongrel

</h3>
<p>
Lastly, follow <a href="http://mongrel.rubyforge.org/docs/mongrel_cluster.html">one</a> <a href="https://web.archive.org/web/20060812140230/http://blog.innerewut.de/articles/2006/04/21/scaling-rails-with-apache-2-2-mod_proxy_balancer-and-mongrel">of</a> <a href="http://blog.innerewut.de/articles/2006/06/21/mongrel-and-rails-behind-apache-2-2-and-ssl">the</a> <a href="http://fluxura.com/articles/2006/05/19/apache-for-static-and-mongrel-for-rails-with-mod_deflate-and-capistrano-support">guides</a> for configuring Apache and mongrel.

</p>
<p>
Let me know if you have any problems with these packages.

</p>
