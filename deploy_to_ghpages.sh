#!/bin/bash
grunt
git add .
git commit -m"Updating site"
git subtree push --prefix dist origin gh-pages