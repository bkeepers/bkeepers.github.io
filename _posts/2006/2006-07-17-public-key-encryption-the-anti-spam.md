---

title: "Public Key Encryption: the anti-spam"
id: 4cf5b682dabe9d2c610006cd
updated: 2010-11-30T21:44:18-05:00
date: 2006-07-17T17:11:00-04:00
tags:
- life
redirect_from: /blog/archives/2006/07/17/public-key-encryption-the-anti-spam/
---

<em><a href="http://ifstatement.blogspot.com/">Daniel Morrison</a> had an <a title="Sign Up?" href="http://ifstatement.blogspot.com/2006/07/sign-up.html">interesting post</a> today about online sites using public key encryption (GPG, PGP, etc.) to reduce or eliminate phishing attempts and give mail recipients confidence in the validity of the messages. This is a great idea and something that I definitely think needs to be explored.</em>

<em>It reminds me of a post that I had on my old blog—which is no longer online and I can't seem to find a backup of—so I thought I would try to re-articulate my thoughts.</em>

Public key encryption could be used as a basis for an anti-spam and anti-phishing system. Mail services like Google, Yahoo, Hotmail, and others could transparently integrate public key encryption support. When you sign up for an account with these providers, they could generate a key and use it to automatically sign outgoing messages.

This solves the half of the problem—all outgoing email would be signed—but what about verifying incoming messages? How do people get my public key to verify my signature? The problem is that public key encryption is based on a distributed trust model. There intentionally isn't an authority that says who can and can't be trusted like there is in the SSL world. It's based on the "I know and trust Joe, Joe knows and trusts Bob, therefore, I trust Bob" model.

At the very least, these mail services could allow you to add other people's public key into your address book. This would be a solution for the security conscious, but in all reality, most users just wouldn't do that. So how does my mail client get Joe's public key to verify his signature without Joe sending it to me and me having to think about it?

Since public key encryption uses email addresses as the human identifier, why not make mail servers into key servers? Similar to the <a href="http://openid.net/">OpenID</a> concept where your home website or blog becomes your identity provider, mail providers could run key servers that make the public key available for all of the email addresses that they serve. This could be combined with a model similar to <a href="http://www.openspf.org/">Sender Policy Framework (SPF)</a>, where mail providers use special DNS records to specify where their key servers are for specific domains. Mail services could then transparently lookup public keys and verify incoming mail. This is a slight variation to the distributed trust model, but it is still distributed. I might not be able to trust everyone that I am getting email from, but I can at least verify that they are who they say they are.

While this method alone doesn't eliminate spam, it would eliminate phishing. As an added benefit, everyone would have the ability to send encrypted email (I imagine the NSA wouldn't support this solution). There's nothing that prevents spammers from signing their messages, but if they did, it wouldn't take long for them to be blacklisted.
