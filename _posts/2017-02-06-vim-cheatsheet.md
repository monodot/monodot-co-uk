---
layout: post
title:  "vim Cheat Sheet"
date:   2017-02-06 00:00:00 +0000
categories: cheatsheet
comments: true
---

My all-time favourite commands for _vim_. Check out these classic hits.

## Formatting

Format/indent/pretty-print an XML document:

    :%!xmllint --format %

Insert spaces instead of tabs (`expandtab`) when pressing the Tab key - how to switch on and off:

    :set et
    :set noet

## Personalisation

How I set up my Vim ready to use:

1. Install [Vundle][vundle] for managing Vim plugins

To install/manage plugins with _Vundle_:

1. Add any plugins required into `/.vimrc`
1. From Vim, type `:PluginInstall`.

To configure syntax highlighting for a file type/extension, add the following to your `~/.vimrc` file:

    au BufRead,BufNewFile *.adoc set filetype=asciidoc

### Using Vim as a Java IDE

Install [SpaceVim][spacevim].

## SpaceVim

- Install using the instructions at [spacevim.org][spacevim].
- If you installed `vim` using Homebrew, then the SpaceVim install script will install itself into your Homebrew install of Vim, so use that by setting an alias, e.g. `alias vim="/usr/local/Cellar/vim/8.0.0604/bin/vim"`
- If colours don't work on Mac, you need to disable "true colours" (??) - add this line to `~/.SpaceVim.d/init.vim`: `let g:spacevim_enable_guicolors = 0`

Keys:

- Toggle file explorer (VimFiler) - F3

[spacevim]: http://spacevim.org/
[vundle]: https://github.com/VundleVim/Vundle.vim
