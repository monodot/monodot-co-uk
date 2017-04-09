---
layout: post
title:  "Asciidoc syntax highlighting in Vim"
date:   2017-04-11 08:00:00 +0000
categories: linux
comments: true
---

I love Asciidoc, and I love Vim.

So why not add Asciidoc syntax highlighting to Vim?

First, you need to download the Asciidoc _syntax file_ into your home directory:

    $ mkdir -p ~/.vim/syntax
    $ cd ~/.vim/syntax
    $ curl -OL https://raw.githubusercontent.com/asciidoc/vim-asciidoc/master/syntax/asciidoc.vim

Now, tell Vim to automatically treat `.adoc` files as Asciidoc:

    $ echo "au BufRead,BufNewFile *.adoc set filetype=asciidoc" >> ~/.vimrc

Finally, **restart Vim**.

TODO: image goes here

Beautiful.
