#!/bin/bash
cd site
grunt
cd ..
git add .
git commit -m"Updating site"
git subtree push --prefix site/dist origin gh-pages