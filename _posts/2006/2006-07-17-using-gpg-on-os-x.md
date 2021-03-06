---

title: "Using GPG on OS X"
id: 4cf5b682dabe9d2c610006c7
updated: 2010-11-30T21:44:18-05:00
date: 2006-07-17T20:52:00-04:00
tags:
- life
redirect_from: /blog/archives/2006/07/17/using-gpg-on-os-x/
---

<p>
<em>I've been posting a lot about GPG and public key encryption lately, so I thought I should at least give some pointers for how to set it up on the Mac. This post is based off of directions written up by <a href="http://daniel.collectiveidea.com/">Daniel Morrison</a> and <a href="http://integernoun.com/">Matt Slack</a>, so kudos to them. </em>

</p>
<hr />
<p>
Getting up and running with GPG on the Mac is quick and very easy. Everything you need is available from the <a href="http://macgpg.sourceforge.net/">Mac GPG project</a> on sourceforge:

</p>
<ul>
<li>
<a href="http://prdownloads.sourceforge.net/macgpg/GnuPG1.4.1.dmg?download">GNU Privacy Guard</a> (currently version 1.4.1) installs the command-line tools.

</li>
<li>
<a href="http://prdownloads.sourceforge.net/macgpg/GPG_Keychain_Access.0.7.0.1.zip?download">GPG Keychain Access</a> is a simple <span class="caps">GUI</span> for managing and creating keys.

</li>
<li>
<a href="http://prdownloads.sourceforge.net/macgpg/GPGPreferences-1.2.dmg?download">GPGPreferences</a> is a System Preferences panel for managing <span class="caps">GPG</span> from the <span class="caps">GUI</span>.

</li>
<li>
Optional tools such as <span class="caps">GPG</span>FileTool (encrypt/decrypt files) and <span class="caps">GPG</span>DropThing (drop text to encrypt/decript) are available at the <a href="http://macgpg.sourceforge.net/">project page</a>

</li>
</ul>
<p>
After you have those installed, you need to generate a key pair. Open <strong>GPG Keychain Access</strong> and select "Key-&gt;Generate…". Of all the options you are presented with, the only one you should need to think about is the key size. While 1024 is secure, 2048 or 4096 are obviously better. Larger sizes can slow you down if plan to encrypt large files, but are unnoticable for email. <em>Note: the larger the key, the longer it will take to generate (one-time process only), so go grab a cup of coffee if you do 4096, unless you have a shiney new MacBook.</em>

</p>
<h2>
Install plugin for Mail Clients

</h2>
<p>
Plugins for your mail clients will allow you to encrypt, decrypt, and sign messages in Mail. Since email is (probalby) the reason we want <span class="caps">GPG</span>, it makes a lot of sense to install them.

</p>
<ul>
<li>
<strong>Apple Mail:</strong> Grab the <a href="http://www.sente.ch/pub/software/GPGMail/GPGMail-10.4.dmg">plugin installer</a> from the <a href="http://www.sente.ch/software/GPGMail/English.lproj/GPGMail.html">GPGMail site</a> It actually is more functional than the commercial <span class="caps">PGP</span> plugin.

</li>
<li>
<strong>Mozilla Thunderbird:</strong> <a href="http://enigmail.mozdev.org/download.html">Download</a> the latest version of <a href="http://enigmail.mozdev.org/">Enigmail</a> from mozdev.

</li>
</ul>
<blockquote>
<em><strong>If you have commercial <span class="caps">PGP</span> installed</strong> it is best to uninstall before installing an email plugin. Apple Mail, for example, will not work with both. You can uninstall just the <span class="caps">PGP</span> email plugin by deleting it from your /Library/mail/bundles directory.</em>

</blockquote>
<h2>
Use It!

</h2>
<p>
What's the point in having it if you aren't going to use it? Upload your public key to one of <a href="http://subkeys.pgp.net/">the</a> <a title="MIT Key Server" href="http://pgp.mit.edu">key</a> <a title="PGP Global Directory" href="https://keyserver.pgp.com/">servers</a>. Get your friends and coworkers to generate public keys and start sending eachother secure mail (if you don't have any friends or coworkers, feel free to download &lt;a href="http://pgp.mit.edu:11371/pks/lookup?op=get&search=0xC0E3268C"&gt;my public key</a> and send me an encrypted email).

</p>
