---
layout: post
title:  "Homebrew cheat sheet"
date:   2017-05-01 17:00:00 +0000
categories: mac
comments: true
---

A selection of commands and info for use with [Homebrew][homebrew].

## Installing apps

Updating an existing Cask app:

    $ brew cask install spotify --force
    ....
    Moving App 'Spotify.app' to '/Applications/Spotify.app'.
    spotify was successfully installed!

## Troubleshooting

**An app doesn't appear in a search using either Spotlight or Alfred**

- Reinstall the app using `brew cask install myapp --force`



[homebrew]: https://brew.sh/
[alfred]: https://www.alfredapp.com/

