---
layout: post
title: The Loyal Renegade
tags:
- essay
---

My mother would call my career path "non-traditional". From a young age, I worked hard. I earned money by helping my brothers with their paper routes until I was old enough to have my own route, mowed lawns in the summer, and worked several jobs on nights and weekends in high school. After one year at a very expensive private school, I realized college was not for me. So I bought some programming books, learned to write software, and am in the middle of a relatively successful career.

{TODO: something about owing my success to my tendency to operate as a loyal renegade.}

---

I want to start my making an assumption: you generally strive to make yourself, the people around you and the company that employs you better. I say "generally" because I'm old enough to have experienced self-destructive phases and depression. Some days, you just don't have the energy to make anything better.

If your interest is purely self-centered or malevolent, then this talk is going to be uninteresting to you, and the parts that are interesting are more likely to get you fired than they are to help you get your way.

## The Elevator Pitch

> When dealing with people, let us remember we are not dealing with creatures of logic. We are dealing with creatures of emotion, creatures bristling with prejudices and motivated by pride and vanity.
>
> <cite>Dale Carnegie – How To Win Friends and Influence People</cite>

<img class="pull-right" style="max-width: 300px" src="http://www.redaktor.de/images/b015177l.JPG">

At the Crystal Palace Exhibition in Manhattan, during America's first World Fair in the fall of 1853, Elisha Otis is hoisted three stories into the air on a platform. The crowd gathered below looks in anticipation of his imminent demise as he raises a hatchet above his head to cut the rope that is holding him up. A fall from the second story–as was common in the industrial lifts of the day–would likely break a leg, but a three story fall was more likely to break his neck.

The audience gasps as Elisha strikes the rope holding the platform in the air. The platform lurches, and then freezes. Still holding their breath, the crowd erupts in cheers of disbelief as the platform remains suspended.

Elisha Otis invented the elevator brake–the metal contraption that prevents a lift from plummeting to the ground if the cable fails. He went on to start the Otis Elevator Company, which started the skyward crawl of buildings. Look down the next time you step off an elevator and there's a good chance you'll see "OTIS" embossed across the threshold.

---

I have worked at [GitHub](https://github.com) since 2011. Before [Git](https://git-scm.com) became the dominate version control tool, people often asked me, "How do I convince my company to use Git?" My response was always the same: don't ask for permission, just show them the benefit.

We started using Git at [Collective Idea](https://collectiveidea.com) in early 2008. A long-time client, who's entire development team of contractors were more likely to be working from an airport or coffee shop than an office, was still using [Subversion](https://subversion.apache.org/). If you've never used Subversion, or it's been a while, let me explain the problem: you need a decent internet connection to anything useful with Subversion. If you want to commit a change, you need an internet connection. If you want to review code, you need an internet connection. If you want to start work on a new feature branch, you need an internet connection. (Oh wait, with subversion you only worked on one thing at a time because the branching model is awful.)

In one of our weekly checkins, we strongly encouraged the client to consider switching to Git. We spent a few minutes expounding the benefits, emphasizing that we couldn't work on his project during the monthly 4 hour car rides to his office or the days spent in airports (mobile tethering and wifi on airplanes were rare in 2008). But he insisted it would be too disruptive to productivity to switch the entire team.

At the end of the day I had to push my code to subversion, but that didn't mean I couldn't use my tool of choice locally. Git actually makes this incredibly simple with the `git-svn` command, which clones a full history from subversion into a local Git repository, allowing you to use the full Git workflow locally, and then syncs your changes back to subversion when you're ready.

A few weeks after the client said we had to continue using subversion, I found myself working from airports and airplanes for the day. Armed with a full checkout of the project in a Git repository, I was able to knock out several features on my fights.

When I got home from the airport, I jumped online to our chat room to check in with the client. As was typical, commits from other developers on the project would show up in the chat room interspersed with our conversation. This was how we kept up on what changes were being made to the code. I pulled up my changes from the day of travel and told Git to sync them all to the Subversion repository. A flood of commit notifications filled the chat room. Hysteria ensued as everyone insisted my account got hacked. I explained that I was using Git. The client started asking a lot of questions.

A week later, the team switched to Git.

> The purpose of a pitch isn’t necessarily to move others immediately to adopt your idea. The purpose is to offer something so compelling that it begins a conversation, brings the other person in as a participant, and eventually arrives at an outcome that appeals to both of you.
>
> <cite>Daniel Pink – To Sell Is Human</cite>

---

The biggest mistake we all make when we try to persuade coworkers and bosses is that we think in terms of what would persuade us.


> So the only way on earth to influence other people is to talk about what they want and show them how to get it.
>
> <cite>Dale Carnegie – How To Win Friends and Influence People</cite>

Git is a far superior tool for managing code, but the client didn't care what version control system we used. He cared about his product. Convincing him to use Git was not about convincing him Git was superior, it was about convincing him that it would make his product superior. Like Elisha Otis’ demonstration of the elevator brake, our client needed to _see_ why git was superior. Seeing commits show up on days where he expected no progress to be made clearly showed the value.

## Benevolent Subversion

After dropping out of college in 2002 and moving to Omaha, Nebraska on a whim with a friend, a fortuitous circumstances landed me a job in the central IT department at the University of Nebraska at Omaha. I was a college dropout with nothing more to show for my experience than the website I made in high school–first with Microsoft Frontpage, and later rebuilt with Macromedia Dreamweaver——for a computer store and some PHP code from a failed "startup" for reselling over-priced used college text books. But I built a reputation of being eager and quick to learn.

The IT department at the university employed about 50 people. Some of us shared an office area in the basement, but the rest of the department was down a hallway and up a flight of stairs. If I wanted to communicate with any of these folks, I had to either send an email and wait (sometimes days) for a response, walk down to their office, or as a last resort, pick up a phone. Oh, I also could have sent a fax, and that probably would have been the quickest way to get a response.

For most people, the phone was the quintessential communication tool for _Serious Business™_. Someone either answered the phone and you could resolve your problem immediately, or you could leave them a detailed message after the beep and they would get back to you as soon as they can. It wasn't considered a distraction, just a necessary cost of doing business.

The standard issue office phone could do anything as long as you knew the proper incantation of buttons, but most people were lucky if they could figure out how to dial an outside number. Its obnoxious screech was a Russian roulette time-bomb, where I had 4 rings to finish my current line of thought and take a wild guess if the caller was interrupting me for a legitimate reason, or if Aaron just wanted to let me know that he could hear George snoring again.

I loathed the telephone.

As the youngest person in the office by nearly 10 years, and a proud member of the ICQ generation, I had seen the future of inter-office communication. Text chat is perfect. I am always online, but not obligated to promptly respond. The interrupter can state the purpose for their interruption and I don't have to respond until I arrive at a point where my current task is interruptible.

A few of my coworkers and I exchanged MSN and AOL credentials and started using IM regularly. It was a dream. By my phone still rang regularly and wouldn't stop until everyone in the office was on IM.

I brought up my desire to set up a department chat server at our weekly team meeting. A few of my allies helped plead the case, and a few of our old-timers were confused by our desire to participate in “internet chat rooms” during work ours. After our closing arguments, our boss concluded that it sounded interesting but didn't really seem like something we should be spending limited time and university resources on.

So I did what every self-respecting 20 year old would do: I ignored my boss, swiped a computer from our IT help desk that had been given its last rites due to a failing hard drive, took it home, installed Linux on it, and installed a chat server. I returned to work the next morning and settled the rogue chat server into its new home in the corner of my office.

I asked our campus directory administrator in the office next to mine if I could get credentials for a "new project I was working on", which would allow anyone in the department use their university ID to sign into the new chat service. I often worked on integrating student accounts with university systems, so me asking for directory access was not a foreign request.  She obliged. I then emailed the network MAC address of the rogue chat server to our network administrator walked down to his office. He was my closest friend at work, and more importantly, one of my chat allies. I poked my head through his door and cut to the chase, and as was our custom: "I just emailed you a mac address. Can you give that a static IP and assign it the domain name `chat.unomaha.edu`?" He looked at me, smiled and shook his head in disbelief.

Less than 24 hours after being told "no" by my boss, I had a chat server running using little more than 30 minutes of university time and an old computer whose remaining days would be spent gathering dust on a shelf before being sold with 200 of his friends at an auction.

I emailed the details for connecting to it to my allies. Over the next few months, use of the chat service organically spread throughout the department as users forwarded the connection details to other coworkers. Pretty soon, most of the department was using it, which we could see thanks to the contact list being populated out of the campus directory.

A few months later, I took the day off of work. Mid-morning my phone rang; it was my boss. "Hey, chat doesn't seem to be working this morning. Didn't you set set that up?" This was the first he had mentioned it since the meeting that he told me not to set it up.

Remember that failing hard drive issue? Well, occasionally, a faint clicking sound would arise from the server in the corner of my office. A swift kick to the side of the case would usually resolve it, but occasionally it required being shut down for a timeout. I instructed my boss to kick the computer sitting in the corner of my office.

The next weekly team meeting included an agenda item for handing off the chat service to one of our system administrators and migrating it to a proper server in the machine room. In just a few months, after being labeled an unnecessary waste of time and resources, instant messaging had become a critical piece of infrastructure in our office communication.

---

> Subversion is used as a tool to achieve political goals because it generally carries less risk, cost, and difficulty as opposed to open belligerency.
>
> <cite>[Wikipedia](http://en.wikipedia.org/wiki/Subversion)</cite>

When my boss denied my request to setup a chat server, I could have pleaded my case. But as a passionate and immature twenty-something, it would have come out as belligerence. Instead, my borderline unhealthy distrust of authority enabled me to hear his concerns–waste of university time and resources–and come up with solutions.

I call this _benevolent subversion_. The intention is not to undermine authority or further self interest, but to solve a problem.

What I love about benevolent subversion is:

1. By definition, subversion **requires action**.
2. It uses **few resources**. - “lean”
3. It **answers a question**. - works or it doesn’t

sometimes we spend more time planning than doing.

But benevolent subversion also carries a great risk: you have to be right, or, be willing to accept the consequences if you’re wrong.

I directly disobeyed my boss. I asked him if I could work on something, he said no, and I did it anyway. That probably makes most people a little uncomfortable.

What if I get fired?

Despite using subversion as one of my strategies for resolving disagreements, I’ve never been fired (knock on wood). I can’t say if it is in spite of, or maybe because of, subversion, but I think I’ve always earned a reputation as someone who is eager to learn and make things better.

Subversion also requires trust. You have to earn trust. requires being in situations where you have the opportunity to be disloyal.

The people that employ us have already chosen to trust us to some degree. They give us a significant amount of money to perform our jobs with some degree of autonomy. I don't know about you, but I'm not in the habit of handing out $50k or more to someone I don't trust.

Someone hired you to do a job, They have to trust you to do that job
If they don't trust you, that's not your problem, it's theirs

But here's the thing, Elisha Otis invented the elevator brake while working for someone else. [story]
 And this wasn't the first time he did it. Otis lathe

> You don’t have to ask permission to take responsibility.
> <cite>Ed Catmull – Creativity, Inc.</cite>


> **The person doing the typing makes the decision.** That’s not to say they should go cowboy and do whatever they want; they should use their knowledge of the “situation on the ground” to figure out what is most practical. With responsibility comes the right to pick a resolution.
> <cite>[Adam Keys](http://therealadam.com/2011/07/16/the-guy-doing-the-typing-makes-the-call/)</cite>

Responsibility
I believe it is crucial to spend time outside of work hours on making yourself better. You’re all attending this meet up in you free time, so I may be preaching to the choir.
Invest in yourself
* when I set up chat at UNO, I had already set up my own server at home
* when I convinced a client to use Git, I had already been using it.
* Elisha Otis spent his whole career solving problems that arose during work

Remember the story I opened with about Elisha Otis and the elevator brake? What attracts me Elisha Otis’ story is that the only reason he was that lift at the world’s fair in New York was because he solved a problem that nobody asked him to solve.

Investing in yourself and solving problems that nobody asked you to solve makes you more trustworthy and creates opportunity.
Otis made several sales, Maize & Burns factory declined, Elisha Otis took the opportunity to make an elevator company out of it. The Otis Elevator Company. His company.
Elevators, necessary evils => essential urban architecture
subsidiary of UTC premiere elevator company
stepped over the name "Otis" last elevator

> It isn’t necessary to work yourself into the ground to be passionate about your work. In fact, it’s hard to sustain your love of a job that is slowly draining all your energy.
>
> <cite>Richard Templar – The Rules of Work</cite>

Constant persuasion and subversion has a cost.

Emil Freireich
national cancer institute 1955, leukemia ward: fever, headache, infections, body lost ability to defend itself
bleeding, bloody nose was potentially fatal
when kids came to the hospital, 90% dead in six weeks

Freireich's team realized leukemia destroying ability for body to make platelets, irregularly shaped cell fragments that float around in human blood, blood coudn't clot.
children needed fresh platelets, often, in massive doses. 5-9 day lifespan
NCI blood bank wouldn't give fresh blood for transfusions
"You're gonna kill poeple!"
recruited donors and did platelet transfusions himself
was told he would get fired if he kept doing platelet transufsions
he decided if he couldn't do it, he didn't want to work there anyway.
The bleeding stopped. Children could now be kept alive long enought to treat the underlying cause.
handful of drugs known to be of any use against the disease, each severely toxic, limited doses
Leading experts suggested reducing dosages. Drugs would kill some of the cancer cells, but not all of them and they would being multiplying again within weeks.
Prolonged the agony and patients died anyway.
Started combining drugs
asked permission from the NCI research oversight board.
"give the smallest dose possible. Anything more aggressive than that is unethical, and giving four drugs at a time is unconscionable"
Went to his boss tht had been through the wars over the platelets controversy.
reluctantly approved
renegade researchers are giving experimental and highly toxic coctails of drugs to four- and fiv-yer-olds at a government labratory.
started to work, but most patients would relapse
every month for a year
intense criticism
Today, the cure rate is 90%

No boundaries in his thinking
the prevailing point of view is X, so I'm going to look at it from Y
by all accounts a brilliant an deciated physician

almost everything said by his friends contains a "but".
volcanic temper, no patience, no gentleness
elements of the man that were easy to love, elements of the man that made him very difficult to get along with
fired seven times

> Curing leukemia and other cancers has been a great gift, but it hasn't been given without any cost.
>
> Michael J. Keating, MD

## Submission

So far we’ve talked about persuasion and subversion. I have spent a lot of my career thus far acting as if these were the two most important tools for convincing people.

If you come into every disagreement trying to convince them that you are right, and when you fail doing what you want anyway, I’ve learned the hard way that it is extremely exhausting for people that work with you. It’s not sustainable. You will burn people out and lose credibility.


If you’re on a team with 5 people, then statistically, you will be wrong 80% of the time…and that’s ok. When you’re working on a team, .200 is a good batting average.


> Every man I meet is my superior in some way. In that, I learn of him.
>
> <cite>Ralph Waldo Emerson</cite>

Avoid Gut Reactions
we’re all passionate about our work, and with that comes passionate responses.
identity is wrapped up in our work
when someone criticizes and idea, it’s easy to feel like they are criticizing you.


https://www.youtube.com/watch?v=GnO7D5UaDig

<div class="embed ratio-4-3">
  <iframe src="https://www.youtube.com/embed/GnO7D5UaDig" frameborder="0" allowfullscreen></iframe>
</div>

Jobs is initially fuming

Watch Jobs’ initial response again

Gives the Job’s death stare
Something about the way we’re wired makes us feel great when we rip into someone…for a moment
pauses, calms down, and starts to blow off criticism
Hear the audience chuckle at the absurdity

[play]
Jobs’ is a craftsman at dealing with people. Knows that blowing it off is not helpful or effective
pauses again, reads between the lines, and acknowledges validity

[play]
acknowledge validity of other person’s view
acknowledge your own shortcomings/mistakes


Avoid Criticism
Not to their face, not behind their back, ever.

> Criticism is futile because it puts a person on the defensive and usually makes him strive to justify himself. Criticism is dangerous, because it wounds a person’s precious pride, hurts his sense of importance, and arouses resentment.
> Dale Carnegie – How To Win Friends and Influence People

There is no reason to criticize someone you know to their face or behind their back. The only reason you should talk about someone is if you’re trying to figure out how to work better with them or thinking through how to give them better private feedback.


Story: Destructive Criticism
Brett
I was really critical of his work
thought I was doing the right thing
turns out, I just didn’t understand him.
two styles of working: quick proof of concept vs. slow and thorough
in retrospect, the project needed Brett’s style more than mine

> Instead of condemning people, let’s try to understand them. Let’s try to figure out why they do what they do. That’s a lot more profitable and intriguing than criticism; and it breeds sympathy, tolerance and kindness.
> Dale Carnegie


> Don’t criticize them; they are just what we would be under similar circumstances.
>
> <cite>Abraham Lincoln, when Mrs. Lincoln and others spoke harshly of the south</cite>

By understanding them, we also learn to persuade them.

> In the moment when I truly understand my [coworker], understand him well enough to [persuade] him, then in that very moment I also love him. I think it’s impossible to really understand somebody, what they want, what they believe, and not love them the way they love themselves. And then, in that very moment when I love them.... I [persuade] them.
>
> Orson Scott Card – Ender's Game

If they are not convinced, I communicated innefectively, or it's not the right thing.



## References

- [How to Win Friends and Influence People](TODO) by Dale Carnegie
- [Creativity, Inc.](TODO) By Ed Catmull & Amy Wallace
- [To Sell Is Human](TODO) by Daniel Pink
- [Six Stories](http://thememorypalace.us/2013/04/six-stories/) from The Memory Palace Podcast
- [Switch](TODO) by Dan Heath & Chip Heath

### [learning] Assimilation
Story: Ruby at UNO
* Otis lathe
* Otis inveting brake for o company
invest your own time to learn/prepare/always be trying to become overqualified

### Submission
Story: Notifications client at GitHub
Excited about meetings to hear other ideas better than my own.
If I can' t convenice someone to do the "right" thing, either:
* I communicated it ineffectively
* It's not the right thing
Admit mistakes/Acknowledge shortcomings
!!!avoid gut reactions!!! https://www.youtube.com/watch?v=FF-tKLISfPE
you can't force soemone else to change, but you can change
Seek first to understand, then be understood.

## Random Thoughts

Earn enough trust that you could take a risk that could get you fired
Earn authority

Not talking about being a workaholic

 [-How do you influence change for the better on projects and in organzations that you are involved in when existing structures are resistent?-] When an appeal to logic through negotiation fails, you can respond to adversity with obedience, dissidence, subversion, or insurgency. All of these reponses are appropriate or harmful in certain curcumstatnces.

In my experience, benevolent subversion is an underused and often effective response.

Autonomy
hands on the keyboard make the decisions

---

http://www.themacrisgroup.com/docs/Update_Oldsite/Vol_1_Issue_0303.pdf

Assumption: your subversion is benevolent instead of malevolent

"Why do people believe Subversive Leadership is necessary?"

"When an organization’s legitimate leadership is ineffective, incompetent, corrupt, or just too busy, those who are responsible for getting the work done change their approach."

"A specific form of malevolent subversive leadership can also be termed ‘malicious obedience,’ that is, following orders one knows will cause harm or damage business prospects."

---


## How To Win Friends and Influence People

"the person who has technical knowledge plus the ability to express ideas, to assume leadership, and to arouse enthusiasm among people— that person is headed for higher earning power."

And when Mrs. Lincoln and others spoke harshly of the southern people, Lincoln replied: “Don’t criticize them; they are just what we would be under similar circumstances.”

"When dealing with people, let us remember we are not dealing with creatures of logic. We are dealing with creatures of emotion, creatures bristling with prejudices and motivated by pride and vanity."

"Instead of condemning people, let’s try to understand them. Let’s try to figure out why they do what they do. That’s a lot more profitable and intriguing than criticism; and it breeds sympathy, tolerance and kindness. "

Emerson said: “Every man I meet is my superior in some way. In that, I learn of him.”

"So the only way on earth to influence other people is to talk about what they want and show them how to get it."

Harry A. Overstreet: "First, arouse in the other person an eager want. He who can do this has the whole world with him.”

Tomorrow you may want to persuade somebody to do something. Before you speak, pause and ask yourself: “How can I make this person want to do it?”

“If there is any one secret of success,” said Henry Ford, “it lies in the ability to get the other person’s point of view and see things from that person’s angle as well as from your own.”

If out of reading this book you get just one thing—an increased tendency to think always in terms of other people’s point of view, and see things from their angle—if you get that one thing out of this book, it may easily prove to be one of the building blocks of your career.

When we have a brilliant idea, instead of making others think it is ours, why not let them cook and stir the idea themselves.


## Sources

Elisha Otis
http://99percentinvisible.org/episode/six-stories/
http://www.examiner.com/article/elisha-otis-and-safety-elevators
http://www.amazon.com/gp/reader/1594631905/ref=sr_1_10?p=S04K&keywords=elisha+otis&ie=UTF8&qid=1389756597
http://www.britannica.com/EBchecked/topic/434691/Elisha-Graves-Otis

<script async class="speakerdeck-embed" data-id="db1be85081140131111c0e3425a38f35" data-ratio="1.77777777777778" src="//speakerdeck.com/assets/embed.js"></script>

Font: http://www.dafont.com/boycott.font

---


It was a simple, succinct and effective way to convey a complex message to in an effort to move others.

He didn't just tell them that he could prevent an elevator from crashing to the ground. He showed them. Nobody had any doubt that it could work.

- best interest in mind
- aroused an eager want
