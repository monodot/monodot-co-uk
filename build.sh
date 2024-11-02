#!/bin/sh

# Install the ruby version specified in .ruby-version
rbenv install

bundle install

bundle exec jekyll build
