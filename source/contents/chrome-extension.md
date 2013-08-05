---
template: layout.jade
---

# Chrome extension

[Install Stable](https://chrome.google.com/webstore/detail/hardy/ckiieicelchfbbpmdbeacaidfjedfmph)

It can be a hassle to create the test files initially so there's a handy Chrome Devtools Extension that will do it for you. Well, almost.

Once enabled, the extension will allow you to click on elements and choose which CSS properties you want to measure. You can do this as many times as you like and at the end, your `feature` file will be automatically created along with a [selector map](selector-maps.html).

## Installation

The latest development version will always be available from [GitHub](https://github.com/thingsinjars/HardyChrome) but, for ease of installation and upgrading, it's easiest to install [the latest stable version from the Chrome Store](https://chrome.google.com/webstore/detail/hardy/ckiieicelchfbbpmdbeacaidfjedfmph). This version will be automatically updated whenever a new version is stable.

## Creating a test

Navigate to the page for which you want to create a test and launch devtools. If installed correctly, Hardy will be a available as a tab along the top.

![Chrome tabs](/images/chrome-tabs.png)

If you select the tab, you'll see the empty test area.

![chrome first](/images/chrome-first.png)

Click the 'Create a feature' button and you will be asked for the name and description of your feature.

![name feature](/images/chrome-name-feature.png)

Now that Hardy is enabled, you can hover over elements on your page and choose what you want to create a test for. Click on an element then name the scenario, friendly element name and property to test.

![chrome full](/images/chrome-full.png)

As you click, your cucumber `feature` file is generated along with your [selector map](selector-maps.html). You can also create multiple scenarios in one session.

![multiple scenarios](/images/chrome-multiple-scenarios.png)

Once you're happy with your tests, you can export the `feature` file and selector map.

### Exported feature file

    Feature: csste.st website
    As a user, I want visual consistency

      Scenario: "Body content"
        Given I visit "http://csste.st/"
        Then "standard paragraph" should have "color" of "rgb(68, 68, 68)"
        And "link" should have "text-decoration" of "underline"
        And "standard paragraph" should have "line-height" of "28px"

      Scenario: "Navigation layout"
        Given I visit "http://csste.st/"
        Then "nav paragraph" should have "color" of "rgb(255, 255, 255)"

### Exported selector map

    module.exports = {
      "standard paragraph": "html > body > div.contain > section > p",
      "link": "html > body > div.contain > section > p > a",
      "nav paragraph": "html > body > header > nav > p"
    }

## Back into the app

You can now take these files back into your Hardy test folder and use them as the basis for your tests. You will probably have noticed that the automatically-generated selectors are extremely specific (particularly if you use something like [Modernizr](http://modernizr.com/) which adds lots of classes to the body) so you should always sense-check the generated files. Think of this as a way to get started, a notch in the wall of testing you can use to get your fingers in to start that first climb up the cliff-face.