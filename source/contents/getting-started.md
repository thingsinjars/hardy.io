---
template: layout.jade
---

# Getting Started

Hardy has been designed to make it as easy as possible to get started with CSS testing, especially integrating it into an existing build process.

<h2 id="installation">Installation</h2>

The recommended installation method is via NPM:

<pre><code><span>~</span> npm install -g hardy</code></pre>

This will install Hardy as a global node module and put an executable in your path. It will also include a local version of Selenium in case you don't have that already and a local copy of PhantomJS for [image diff](http://csste.st/techniques/image-diff.html) test processing.

<h2 id="first-tests">First tests</h2>

Create a new folder to hold your test files.

<pre><code><span>~</span> mkdir myfirsttest
<span>~</span> cd myfirsttest/</code></pre>

Now we can make a basic first test. Once you've done this a couple of time you won't need help but for starters, use the helper:

<pre><code><span>~/myfirsttest</span> hardy init</code></pre>

This will create the important folders and files

Inside the new file `test.feature`, add this initial test:

    Feature: Website layout test
    As a user I want visual consistency on the http://csste.st/ website

    Scenario: Content layout
    Given I visit "http://csste.st/"
    Then "section > p" should have "color" of "rgb(68, 68, 68)"

Before we run the test, we need to start Selenium which will send the tests to the browser:

<pre><code><span>~/myfirsttest</span> hardy selenium start</code></pre>

From the command line, run our test:

<pre><code><span>~/myfirsttest</span> hardy .</code></pre>

  You should see successful output:

    Hardy v0.0.2
	CSS Utils Steps Loaded
	CSS Steps Loaded
	Generic Steps Loaded
	Loading browser firefox
	...Shutting down browser


	1 scenario (1 passed)
	3 steps (3 passed)
	firefox success

## What's next?

That's all we need to do for basic tests. To really get the most out of Hardy, continue to learn about [Selector maps](selector-maps.html).