---
template: layout.jade
---

Continuous integration
===

The whole point of automating your tests is so they are easy to run without human intervention. The best - and most effective - way to do this is through a continuous integration build pipeline. This is a guide to set up automated Hardy tests using [Travis CI](http://travis-ci.org/).

Scenario
---

We have a static-page website. The code to build the site and the original content are kept in the `master` branch of a project on GitHub. Once built, the rendered pages are put into the `gh-pages` branch and pushed to GitHub again where they are served. 

This is quite a common scenario and one into which we can easily integrate Hardy. The [build process for this website](https://github.com/thingsinjars/hardy.io) follows this pattern and can be used as a reference.

Pipeline
---

The steps involved in our complete pipeline are: 

 1. Make a change locally
 1. Commit and push to GitHub
 1. Travis CI detects the change and pulls the `master` branch
 1. Travis builds the static site
 1. Travis runs all the included CSS tests via Hardy and either passes or fails
 
###  Extra credit advanced pipeline
  
  1. On success, Travis checks out the `gh-pages` branch
  1. Travis copies the newly generated files into `gh-pages`
  1. Travis pushes to GitHub

If everything works properly and your tests pass, this involves no more work than making a change and pushing it to GitHub.

Travis Hook
---

The best reference for setting up Travis for a GitHub project is [the Travis documentation](http://about.travis-ci.org/docs/user/getting-started/). Essentially, it involves connecting your Travis account with your GitHub project. They explain it better.

Once connected, your project will be pulled into Travis on every commit, your dependencies will be loaded and your set of build scripts will be run.

Dependencies
---

The only real dependency you need to run Hardy tests on Travis is Hardy. You may also have a static-site generator such as [Wintersmith](http://wintersmith.io/) or [Blacksmith](https://github.com/flatiron/blacksmith) in your project's `package.json`. Make sure your `package.json` contains Hardy as a development dependency:

    "devDependencies": {
      "hardy": "0.0.10"
    },

*Note: the version number may be different, please use the latest version.*

Build scripts
---

This varies slightly depending on whether you want to just test in PhantomJS or if you also want to run your tests in Firefox. These are the only two browsers available on Travis.

### `.travis.yml`

If you followed [the Travis documentation](http://about.travis-ci.org/docs/user/getting-started/), you'll have a `.travis.yml` file in the root of your project. We need to add to the `before_script` section:

    before_script:
      - export DISPLAY=:99.0
      - sh -e /etc/init.d/xvfb start
      - node_modules/hardy/bin/hardy selenium start
      - {BUILD YOUR STATIC SITE HERE}
      - python -m SimpleHTTPServer&

If you aren't testing in Firefox, you can leave out the first two commands.

*Note: ensure the python server is run from the directory hosting your generated files.*

### `package.json`

Following this setup, Travis will run `npm test` to trigger any tests you have configured. In your `package.json`, add the following:

    "scripts": {
      "test": "node_modules/hardy/bin/hardy --browser=firefox,phantomjs test"
    },

In this example, we are testing with both Firefox and Phantom. Our tests are kept in the folder `test`.

Run
---

This is all that is required for our basic pipeline. Whenever a change is pushed to GitHub, it gets build, tested and Travis returns a pass or fail. All automatically.

[hardy.io build pipeline source](https://github.com/thingsinjars/hardy.io)

Extra credit advanced pipeline
---

Following some extra configuration, it is possible to push any successful build directly to `gh-pages` so that the complete deployment pipeline is automated.

The article "[Fun with Static Site Generators and Travis](http://wesleyhales.com/blog/2013/03/29/Fun-with-Static-Site-Generators-and-Travis/)" details how to get your OAuth secret for GitHub and provides an example script to run on success.

For hardy.io, this involves adding this to the `.travis.yml` (along with an encrypted OAuth token):

	after_success:
	  - bash post_build.sh

This will run [the deployment script](https://github.com/thingsinjars/hardy.io/blob/master/post_build.sh) after every successful build.