---
layout: post
title:  "Homebrew cheat sheet"
date:   2017-05-01 17:00:00 +0000
categories: mac
comments: true
---

A selection of commands and info that I use with [Homebrew][homebrew], to help me remember for those times when I inevitably forget everything.

Hope you find these useful!

## Installing apps

Updating an existing Cask app:

    $ brew cask install spotify --force
    ....
    Moving App 'Spotify.app' to '/Applications/Spotify.app'.
    spotify was successfully installed!

## Services with Homebrew

**View all system services** configured/managed by Homebrew (e.g. cassandra, mysql, nexus, etc.)

    $ brew services list

**Start** a service:

    $ brew services start nexus
    ==> Successfully started `nexus` (label: homebrew.mxcl.nexus)

To **view information** on an app that is configured with a service:

    $ brew info nexus
    ...
    To have launchd start nexus now and restart at login:
      brew services start nexus
    Or, if you don't want/need a background service you can just run:
      nexus start

## Troubleshooting

**An app doesn't appear in a search using either Spotlight or Alfred**

- Reinstall the app using `brew cask install myapp --force`



[homebrew]: https://brew.sh/
[alfred]: https://www.alfredapp.com/

