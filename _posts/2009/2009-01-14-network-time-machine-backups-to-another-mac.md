---

title: "Network Time Machine backups to another Mac"
id: 4cf5b657dabe9d2c610000ce
updated: 2010-12-01T02:26:18-05:00
date: 2009-01-14T21:59:00-05:00
tags:
- life
- popular
redirect_from: /blog/archives/2009/01/14/network-time-machine-backups-to-another-mac/
---

For a while now I've been wanting to setup Time Machine on my MacBook Air to backup to the external drive plugged into my Mac Mini, but one thing has been stopping me: transferring 80GB over wifi. I've tried it a couple times and even after 24 hours it's nowhere near done (Time Machine slowness + wifi slowness = double slowness).

I also tried getting an initial backup by plugging the drive directly into my MacBook and then moving it back to the Mini once it's done. But Time Machine stores network backups differently than it does if the drive is plugged in locally. When backing up over a network, it creates a sparse bundle disk image.

So last night I finally tried again and got it to work. The trick was to start the backup over the network which sets up the sparse bundle, and cancel it shortly after it started. Then when I plug the drive directly into my laptop, Time Machine is smart enough to see the sparse bundle and use that.

Here's the recipe for getting network backups to an external drive started without doing the initial backup over the network:

<ol>
<li>
<p>
**Share the drive**: With the backup drive still plugged into your *host* Mac (**not** the one that needs backed up), share the drive by going to Sharing in System Preferences. Enable file sharing and add the drive to "Shared Folders".

</p>
</li>
<li>
<p>
**Start the network backup**: First, you need to enable backing up to "unsupported" network volumes (a.k.a. ones you didn't shell out extra money to apple for). On the machine you want to back up over the network, open up terminal and run:

</p>
    defaults write com.apple.systempreferences TMShowUnsupportedNetworkVolumes 1

<p>
Now, go to Time Machine preferences and you should be able to select your shared drive should appear in the list of disks.

</p>
</li>
<li>
<p>
**Cancel the backup**: After the backup is done preparing and starts copying data, cancel it.

</p>
</li>
<li>
<p>
**Attach drive directly**: Eject your external drive from the *host* machine and plug it directly into the machine you want to back up. There should be a file on it titled \[machine-name\]\_\[MAC-address\].sparsebundle. Make sure there is **NOT** a folder in `Backups.backupdb` with your machine name. I believe Time Machine will try to use that if it exists instead of using the sparse bundle.

</p>
<p>
Now go to Time Machine preferences and switch your backup drive to the local drive. It should run a full backup now using the sparse bundle.

</p>
</li>
<li>
<p>
**Switch back to network backup**: Move your drive back to your *host* machine and switch Time Machine preferences to use the network disk. Sit back and enjoy network backups.

</p>
</li>
</ol>
This worked for me. Let me know in the comments how it works for you.

The network backups have been working great so far. I closed my laptop while a backup was running this morning. When I opened my laptop back up on a new network, it complained that the network connection had been lost to the backup drive, but as soon as I got home this evening, the backup started again immediately.
