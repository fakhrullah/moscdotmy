#!/bin/bash

printf "
===============================
  Publishing to gh-pages
===============================
"

# check if git is installed
if ! [ -x "$(command -v git)" ]
then
	printf "
	git is required.
	Install git then run this script again
	"
	exit 1
fi

# check if hugo is installed
if ! [ -x "$(command -v hugo)" ]
then
	printf "
	git is required.
	Install git then run this script again
	"
	exit 1
fi

printf "
Clear old publication

> rm -rf public
"
rm -rf public # clear off old publication

printf "
What is this?

> git clone .git --branch gh-pages public
"
git clone .git --branch gh-pages public

printf "
Generate website

> hugo
"
hugo

printf "
Publish

> cd public && git add --all && git commit -m \"Publishing to gh-pages\" && git push origin gh-pages
"
cd public && git add --all && git commit -m "Publishing to gh-pages" && git push origin gh-pages

printf "
Checkout gh-pages

> git checkout gh-pages
"
git checkout gh-pages

printf "
Push to build website in server

> git push origin gh-pages
"
git push origin gh-pages
git checkout master

