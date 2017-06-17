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

## Files

Undo changes to a file (discard unstaged changes):

    git checkout -- filename.txt

## Merging

Merging changes from the development branch into master, and squashing the intermediate commits:

    git checkout master
    git merge --squash develop
    git commit

## Forks

Sync a fork to keep it up-to-date with its upstream repository:

    cd my-forked-repo
    git remote add upstream https://github.com/username/original-repo
    git fetch upstream
    git checkout master
    git merge upstream/master
    git push origin master 

## Submodules

Add a submodule to an existing project:

    git submodule add https://github.com/username/example-repo new-directory-name

