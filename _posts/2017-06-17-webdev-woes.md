---
layout: post
title:  "Web development woes"
description: "Tracking my frustrated attempts to re-enter web development"
date:   2017-06-17 10:00:00 +0000
comments: true
---

So, I'm dabbling in web development again. 

After years of solely doing enterprise-y Java stuff with my consulting day job, I'm now investing my free time building a [simple online invoicing tool][billform].

I'm mostly doing this to see whether I can [just f**king ship][jfs] something for a change.

_(I'm not the best at seeing side-projects through to completion. I have lists and lists of personal projects that I either never finished, or didn't even bother to start.)_

But I'm also doing this because I realise that there is a huge gulf between enterprise Java middleware, where I'm reasonably comfortable, and the web development of the "real" world. And by "real" world, I mean the crazy unicorn-filled world of SaaS and mobile apps.

I want to bridge that gap and actually find out how people build webapps these days. And jeez, it's not easy.

## The state of affairs

I haven't done web development since about 2008, when I was developing in ColdFusion. Yuk. (Although the tags were pretty)

A lot of my time was spent with this gem:

![Allaire Homesite]({{ site.url }}/assets/allaire-homesite.jpg)

Actually ColdFusion wasn't my first intro to web development. I used to build with PHP, but long since abandoned that. Too many hours spent sanitising the `$_POST` variable. 

Frameworks for PHP came along later, but by that point I had moved onto ColdFusion. Later, I picked up Java again, where I've stayed since.

So going into web development now, I'm finding myself playing an almost 10-year catch-up game.

Since then, the following things have happened:

- The meteoric rise of Git, along with associated hosting services like GitHub and [Bitbucket][bitbucket] (which is what I use)
- The dominance of JavaScript, jQuery, Node JS and friends
- CSS3, flexbox, responsive design, mobile-first
- "Brexit"

## My stack

To make a start with Billform, I needed to choose a stack quickly.

I decided to make the most of what I already know. I didn't want to waste hours learning a brand new language.

So, I went with PHP. Because I already know the language, and people still seem to use it.

But, I wanted to find something that would help me write 'modern' PHP, and especially to be able to stick to an [MVC pattern][mvc]. 

So, I chose a framework. And that framework is [Laravel: "the framework for web artisans"][laravel].

Yep. Artisan. That's definitely me.

![That's me](https://media.giphy.com/media/DWE7Flas4bkdy/giphy.gif)

I chose Laravel because it is relatively mature, is still under active development, and has a lot of features I need, such as database abstraction, configuration management and routing.

It also has a huge user base. Just look at all these stars for [laravel on GitHub][laravel-github]:

<iframe src="https://ghbtns.com/github-btn.html?user=laravel&repo=laravel&type=star&count=true&size=large" frameborder="0" scrolling="0" width="160px" height="30px"></iframe>

To get started, I gorged on content from [Jeffrey Way's excellent Laracasts][laracasts] and thanks to the posts of [Adam Wathan][adamwathan] I decided to take a Test-Driven Development approach to build. 

Now, I've got test cases implemented and passing, and I'm easing comfortably into a development workflow.

All of these advances in PHP development have made sense to me, because they are the same concepts I already know from the Java world (Hibernate for database abstraction, JUnit for testing, and so on.)

Where I'm having a **really hard time** is in catching up with front-end development. 

## The hard part

My first blocker in this respect is understanding **Node** and the sprawling ecosystem that has grown up around it. 

Node and its pal **npm** now seem to own the front-end development process.

Let's take an example. I decided to use a CSS framework called [Bulma][bulma] for Billform. 

To install Bulma, I'm [encouraged to use `npm`][bulma-install] to install it as a dependency:

    npm install bulma

Meanwhile, in the documentation for Laravel, I'm encouraged to use [Laravel Mix][laravel-mix] to start _compiling my assets_.

I'd like to be able to tweak and override the Bulma CSS. And I also want to adopt the tools recommended for the Laravel framework. So I think that using an asset pipeline like Laravel Mix is what I need to do. And therefore I also need to understand **npm**. But jeez it's quite complicated.

For example, this is the error that prompted me to take a break and write this blog post:

![These files actually exist]({{ site.url }}/assets/npm-error.jpg)

(For the record, I'm still trying to decipher this one, because those dependencies that are "not found", actually **do** exist on my hard disk. So what's the issue here?)

So far in _just getting started_, I've been encouraged to reinstall everything using `rm -rf node_modules && npm install`. This took about 30 minutes and made my moderate-spec laptop almost melt. 

I can't think what it was doing that could have been so complicated.

Then I thought I might need to upgrade **node**. This was my introduction to the Node version numbering scheme. I was running `node 0.10.4`. The versions seem to have been 0.10.x, then 0.12.x, then... _4.x_? Then 8.x was released, after only one year! This makes Firefox's version numbering seem normal.

![Musings on the node versioning scheme](https://media.giphy.com/media/zXj92SqHuz2p2/giphy.gif)

And so now **npm** tells me it can't find a dependency that I'm sure exists. 

At the same time, Laravel Mix tells me that it can't find 'babel-loader', whatever that is.

Here's the list of packages that **npm** says are installed in my project (that's a fairly simple Laravel project, using Laravel Mix and Bulma):

    $ npm list | wc -l
    7052

**7,052 packages**. That is absolutely **insane**.

Is web development really this hard?

## Closing thoughts

So far, I'm finding that I'm still more comfortable with back-end work. No surprise there. :)

Very similar tools and processes are being followed. Familiar approaches to software development. Architectural patterns I know. I feel at home.

By contrast, dipping my toe in the front-end is proving to be a huge learning curve for me. Even something as simple as including a CSS framework is proving very challenging. And this is even before I've written a single line of JavaScript.

I love learning new stuff, and that's one of the things that keeps me in IT.

But man, Y U make thing so complicated?

![Complicated meeting](https://media.giphy.com/media/1Go6snuhSIxQ4/giphy.gif)


[billform]: https://billform.com
[jfs]: https://stackingthebricks.com/just-fucking-ship/
[laravel]: https://laravel.com/
[mvc]: http://www.dummies.com/web-design-development/mobile-apps/the-model-view-controller-mvc-design-pattern/
[laravel-github]: https://github.com/laravel/laravel
[laravel-mix]: https://laravel.com/docs/5.4/mix
[laracasts]: https://laracasts.com/
[adamwathan]: https://adamwathan.me/
[bitbucket]: https://bitbucket.org/product
[bulma-install]: http://bulma.io/documentation/overview/start/
[bulma]: http://bulma.io
