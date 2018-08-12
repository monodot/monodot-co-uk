---
layout: post
title:  "What I've learned while writing my first book"
description: "Figuring out what I'm learning from writing my first book, Camel Step-by-Step"
date:   2018-08-12 10:00:00 +0000
comments: true
---

In March this year, I started writing my first book, _Camel Step-by-Step_, and the process of writing has helped me learn a few things.

As I'm nearing the end of writing now, I wanted to write this post to take stock, and document what I've learned so far. So far the experience has been pretty enlightening, both on a personal and a technical level.

To tell the complete story of what I've learned, I need to start at the beginning.

## Starting out

Creating a product is something I've wanted to do for some time. 

As a natural introvert, writing a book was the first thing I thought of. Writing a book allows me to share knowledge and help other people (whilst at the same time hiding behind a computer screen and not having to talk to anyone).

So, I started out in March. I picked a topic -- the Java framework [Apache Camel][camel], which I've already been blogging about for a couple of years -- and I threw together a rough book outline and a landing page, in one weekend. 

TODO - picture of landing page

The outline was mostly a guess, based on questions I get asked at work, things I wish I'd known when I first started, and the topics of my most popular blog posts.

## It takes me a long time to write

I already acknowledged in a [previous post that creating is hard][1].

Since March, I've built up the book content a little more slowly than I expected. Today I just hit 25,000 words.

That means that over 5 months, I've averaged 5,000 words per month. It's not particularly fast.

I've improved somewhat since the beginning. What's helped the most has been assigning myself tasks, and trying to write in the mornings. I'm now writing quicker than I have previously.

But I'm still not yet at the stage where I find it easy to write. I think that will take time.

## Nobody tells you where to stop

When you're writing a non-fiction book, how do you know where to stop? I could write about my topic for months and months... and still not be finished.

At what point do you draw the line? I created an outline of the book, and published it to a landing page, before I even started writing. Yet I'm still adding chapters to the book which I didn't expect I would be writing.

I'm starting to see the process of writing a non-fiction book like a giant quiche. 

TODO - picture of quiche

At the edges of the quiche are the most advanced and complicated topics that I want to write about. The smaller the pie, the simpler the topics. But as I write about more complicated topics, the size of the pie grows.

I can't just write about the advanced topics at the perimeter. I have to explain the underlying, more basic concepts. This means I have to fill in the rest of the quiche. These explanations allow people to reach the edge (and the tasty crust).

But at some point, I have to draw a line at how deep I want to go into the topic, because the quiche will get too big for the dish (and making the filling in the middle will take ages).

(btw I like quiche.)

## Every day I'm learning

The most enjoyable part of writing a book has been _learning every day_.

Although I've worked with [Apache Camel][camel] for over 3 years, there's still a ton I don't know. There's also a huge ton I don't know about Java, either. I work in a relatively small area of the language. 

TODO - you know nothing, Jon Snow

It's frustrating to realise what I don't know, but it's what **drives me forward**. The act of writing a book forces me to recognise the limit of my knowledge: what I can already explain easily, and what I need to research further before writing.

If I don't know something, I go and search for it, and learn.

## Break it down into chunks

If I don't have a concrete idea of the task I'm meant to be working on, I can easily get caught in _minutiae_ and lose sight of the bigger picture.

TODO - trello board

My Trello board helps to keep me on track. I create cards for book chapters and other tasks. When I complete a task, I mark it as completed, by archiving it.

I also use Trello as a bucket to store any other ideas I have. Some of these ideas will make it through into the finished book; others, I might park.

## Writers' block (it's only a draft)

> When faced with writer's block, lower your standards and keep going

-- William Stafford

Sometimes I write the same sentence three or four times, deleting it each time. Then I read it back and I sigh, thinking it looks terrible. 

My problem is that I want the draft sentence to be perfect and complete. So I get stuck and wonder whether I'll ever manage to write the sentence I want.

My solution in this situation is to follow the quote above: lower my standards and keep going. I grit my teeth, I write the sentence anyway and resolve that I will improve it later at the editing stage.

## I sweat the small stuff

Even before I started writing, I'd already decided that I didn't want to use a word processor to write the book. I wanted the flexibility of writing it in plain-text and using a toolchain to typeset the book for me.

TODO - picture of typesetting

I know that I could have finished the book earlier if I'd have used Google Docs or LibreOffice (or Microsoft Word) to write.

But owning the entire process from end-to-end has been one of the big positives for me. I've enjoyed quite a lot of the tiny stuff, even things like choosing typefaces and formatting. 

I decided to write using [Asciidoctor][3], and I've learned a ton about it. I'm definitely going to use it for my next project! Recently, I've also discovered the [Asciidoctor Maven Plugin][4] for publishing, and from that I've learned a ton about Maven, too.

## I do my best work in the mornings

I always thought that I was "a morning person", but writing a book has really confirmed my suspicions about that.

I've tried many times to write in the evenings, after getting home from work. Sometimes I get the spark, but mostly I just stare at the laptop screen, or get sidetracked by blogs and Twitter.

But when I wake up early in the morning, as long as I know what my next task is, I can crank out 500 words before work, without a problem.

I think I'm at my creative best in the mornings. If I want to be up early in the morning to write before work, then I must go to bed early. I usually don't find that to be a problem, but if I'm busy after work and come home late, then that throws the morning routine out the window.

## Tracking helps

[Strides][strides], an iOS app I downloaded years ago for goal and habit-tracking, and which I've picked up again and found useful for tracking exactly which days I've been able to write.

Tracking my progress via the total word count of the book. I use a simple Google Sheet and a chart to show progress as I move towards the finish line.

## Life gets in the way

Finally, life is just busy, especially as I am currently working away from home, in the beautiful city of Edinburgh. This means I travel Mondays and Fridays, so they're less than ideal days to work on the book.

TODO - picture of a busy calendar?

All those entrepreneur bloggers you follow on Twitter? How many of them are creating products whilst working a full-time job? This can leave you with an unrealistic expectation of what's actually possible in your own free time.

Life gets in the way, so I miss a few days every now and then, for seeing friends, meeting people, nights out with colleagues. 

Embrace it. No project is worth sacrificing all social contact for.

---

Thanks for reading.





[1]: /writing-a-book/
[camel]: http://camel.apache.org/
[3]: https://asciidoctor.org/
[4]: https://github.com/asciidoctor/asciidoctor-maven-plugin
[strides]: https://www.stridesapp.com/
