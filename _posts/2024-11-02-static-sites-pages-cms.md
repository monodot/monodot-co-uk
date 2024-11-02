---
date: 2024-11-02
title: How to reboot my static sites - discovering Pages CMS
---
Recently I've been trying to drum up the enthusiasm for tidying up and overhauling my current [heap](https://www.tutorialworks.com) of [static](https://tomd.xyz) [sites](/).

I don't update these websites very often. They usually start out with a bang and a flurry of activity. But some of them haven't been updated in over 2 years.

Why haven't I updated them? It might be because they are static websites. This method of building blogs comes with some serious technical baggage. It's not for the faint-hearted. Static sites usually need to be updated with a code editor, and then the changes pushed up to [a Git repository](https://github.com/monodot/monodot-co-uk).

That's fine when I'm learning new things. I can spend all day learning something new.

But once the site is set up, and when I spend all day in a code editor at work, the thought of spending _even more time_ in a code editor to produce my "creative output" feels like a bit of a slog.

So this week, I wondered: should I install a full CMS like [Ghost](https://ghost.org/) on these sites? Would that make the writing and editing process easier?

And so, I went into the weeds of how to deploy Ghost. I discovered a tool called Coolify which gives [one-click deployment of Ghost onto a VPS](https://coolify.io/docs/services/ghost). Neat, I thought. So I spun up a VPS in Hetzner, I tried it out, and thought Ghost felt OK. The sites look great, and the experience is pretty cool.

But I was still pretty unimpressed with the post editor. It looked fancy and all, but it's not suitable for blogs that talk about code, at all. It's clearly designed for proper **_writers_**.

So, clicking around Hacker News, as I usually do when looking for a bit of inspiration from my peers, I stumbled upon [Pages CMS](https://pagescms.org/). Pages CMS is an open source, web-based content editor for static sites, just like this one. This site is built with Jekyll, but Pages CMS also supports Next.js, Astro, Hugo and others.

I'm really impressed with it so far. It was incredibly easy it was to set up, and I really like the fact that I can self-host it, if I wish.

I'm going to install it on some of my other sites and see how easy it is to get the writing bug back again.

And who knows, maybe you might see more blog posts here soon!