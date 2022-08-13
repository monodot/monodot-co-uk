I’ve been spending the past few days trying to think of the ‘perfect’ tech stack, for a new app that I’m working on. 

My latest idea is an app to make it easier to offer a discount on your Gumroad products, according to the country of the purchaser. 

So, your fans from around the world can buy your product at a price that suits their local economy. 

It’s a pretty simple idea but it does require some development. So I’ve been thinking of how to get started. And I’ve going round the houses with this decision. 🤡

So far, I’ve considered the following:

## AWS Lambda, Serverless Framework

It’s beguiling but seems to become immediately complex. I think I have to learn a new language (Python, JavaScript) and DBMS (DynamoDB) to be productive. 

Plus, I’m tied into AWS, which I don’t want. 

Perhaps if I was working with this stack every day, it might be easier, but I’m feeling it’s too much of an uphill climb. 

Trying to be ruthless with my time, I’ve killed this idea. 

## Hasura/Postgresql and JS frontend

Hasura is a trendy GraphQL API layer for your PostgreSQL databases. It’s a low-code way to generate APIs quickly.

The general opinion on Hasura is pretty good. I can design tables, and have a GraphQL API up and running. 

But the problem is that I have to self-host a Postgres database, and Hasura too. The Hasura Cloud offering is just too expensive, so I’d need to self host.

Plus, I don’t know how long Hasura is going to be around for. I don’t want to build something today using an API that’s going to be withdrawn tomorrow.  -->




Over the lockdowns and work-from-home orders of 2020 and 2021, I spent a lot of time on my computer. _A ton, actually._

With few distractions available to me in the real world, I kept myself occupied in the flat by building things. Tiny little things.

I keep a list of my [small][smallbets] [bets][levelsio]. These are little ideas which I might think of, have a flurry of activity on, and then come back to later.


Over the last year or so, I have created a few side-projects (think shitty little apps), and I've been using the opportunity to play around with frameworks and languages that are new to me.

Nobody wants to build using technology that's "built for the enterprise".

You're not going to win any innovation awards for using Spring and MVC. But I think it’s time to reconsider that stance. 

Innovation doesn't have to mean "choose the hottest, most immature technology available, and wrestle with it for weeks". It can equally mean "choose the technology that works, so you can spend more time adding features."

## Learning new tricks, coming back to old ones

In 2020, I finally decided to take action and learn some new tricks. I learned the basics of server-side JavaScript, creating APIs with [Express][express] and Node.js. 

I also dabbled with AWS Lambda. 

I played around with [Serverless Framework][serverless], because a colleague recommended it to me. I was amazed at the beginning. Built-in CI/CD and infrastructure-as-code! _Wow!_

But then I got fed up. It seemed to change almost every day. Finding up-to-date documentation and examples was really hard (how do you Google a product called _"serverless"_? It's like naming your product _"product"_). And I was bewildered at the number of objects that Serverless was creating in my AWS account, just to deploy an API.

My curiosity just faded, enthusiasm waned, and I parked the project for a while.

Coming back to the same project 6 months later, I wanted to add some new functionality. I entered that "re-learning" mode, where you feel like you're learning something all over again. 

I was confused which environment was deployed, and which redundant objects could be deleted. And, because I don't work with these technologies **every day,** the friction involved in re-starting a project again.... learning those quirks, the build process, the deployment process...

**Every day.** A lightbulb moment. 💡

Why not just use the technologies that I already use every day, with customers? I won't get any internet points for using Java, but I know it, and that's a good enough reason to just stick with what I know.





One of these projects was a simple polling app. It was all Serverless with Lambda and a Svelte single-page-app front end. 

But then I realised I was spending such a huge amount of time keeping up with it all. And yet **I already have the knowledge to create a web app**. I’ve been doing it since 1998 with PHP.

These days I wouldn’t use PHP. I wouldn’t know how to properly secure it. 

So why not use the technologies I already know and use for my customers every day?? -->


## Build with the stack I'm most familiar with

Java (well, specifically Spring) is the application development stack that I’m most familiar with.

Spring's been around for 17 years. The first release was in 2004. I remember coming across Spring Framework 2, when I was in my first job out of university and developing [JSR-168 portlets][jbossjsr168] (they were going to be the future - except they weren't). 

In my first job out of university, we trialled Spring Framework 2.x on a new standalone web app. It was weird, verbose, and full of _beans_.

**Spring doesn't change very often.** It's backed by big companies (e.g. VMware/Pivotal) and is used in all the slow, dull, corporate environments. These are the kind of organisations who don't want to upgrade frameworks or change staff every 6 months.

Now I have a list of unfulfilled app ideas as long as War & Peace. And I've ignored Java/Spring for my own personal projects, because it didn't seem very _exciting_. And also because I wanted to learn something new.

But Spring isn’t going anywhere. And it comes with a batteries included (a gigantic pack of batteries of all shapes and sizes). There's no need to pull in some obscure dependency, just to get basic functionality. It's less likely to suffer from the [is-odd problem][isodd].

If I'm feeling particularly masochistic, I could even add obscure features like [XA transactions][xa2] to my app. If I want. The [feature is available in Spring][xa], just add the relevant Maven dependency, find the right annotations, and off you go.

Everything is stable, curated, and feature-complete.

**So why the heck didn’t I consider it before?** Because it's not very exciting. Because I thought I should be learning something new. Because I thought that my ideas are somehow special, and must be built on new technology.

But, my app is just a simple interface onto a database. Create poll. View poll. Respond to poll. It's very boring. It's about as simple as it gets.

So, I tried it. 

I just rewrote a polling app I'm working on in Java and it feels great. Definitely not sorry.

## Spring Boot is actually a great framework

News at 6. There's a reason why people choose boring technology. Because it actually works.

