---

title: "Passenger and browser testing in virtual machines"
id: 4cf5b653dabe9d2c61000038
updated: 2010-12-01T01:54:21-05:00
date: 2010-02-08T23:33:00-05:00
tags:
- code
redirect_from: /blog/archives/2010/02/08/passenger-and-browser-testing-in-virtual-machines/
---

If you're running Passenger in development, here is how to make Windows running in a virtual machine connect to your app in Passenger.

\# Boot up the VM and open up the Windows command prompt (go to "Start-&gt;Run…", enter "cmd" and press enter)

\# Type `ipconfig` to see the network configuration. Take note of the "Default Gateway" address. <!-- Image not found: http://opensoul.org/assets/2010/2/9/ipconfig.png -->

\# Navigate to C:\\WINDOWS\\system32\\drivers\\etc and edit the `hosts` file. Add a line with the gateway address pointing to your app's domain (you can even list multiple on the same line).

<pre>
172.16.248.2 awesomeapp.local otherawesomeapp.local

</pre>
1.  Open up a browser in the VM and type in the address.

Tada! Now you can test out your app in those other browsers.
