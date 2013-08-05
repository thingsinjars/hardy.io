hardy.io
===

Website for [Hardy](https://github.com/thingsinjars/GhostStory/tree/webdriver)

Aside from everything else, this site also integrates Hardy CSS tests with Travis CI. Check out the `.travis.yml` file to get an idea of what it does.

Essentially, the bits needed are:

    - export DISPLAY=:99.0                          # Required for testing in Firefox
    - sh -e /etc/init.d/xvfb start                  # Required for testing in Firefox
    - node_modules/hardy/bin/hardy selenium start   # HARDY
    - python -m SimpleHTTPServer&                   # HARDY

Then in your `package.json`, you'll need to specify the Hardy test command:

    "scripts": {
      "test": "node_modules/hardy/bin/hardy --browser=firefox,phantomjs test"
    },
    
The other things in the `.travis.yml` file are part of the static site generation.

Current build status
---

![Build status](https://api.travis-ci.org/thingsinjars/hardy.io.png)
