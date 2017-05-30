---
layout: post
title:  "Git Cheat Sheet"
description: "A page of useful commands and one-liners for Git."
date:   2017-05-26 09:00:00 +0000
categories: cheatsheet
comments: true
---

This page is just some useful commands for Git that I keep forgetting. 

This is an evergreen page, updated every now and then.

{% include toc.html %}

## Merging

Merging changes from the development branch into master, and squashing the intermediate commits:

    git checkout master
    git merge --squash develop
    git commit

