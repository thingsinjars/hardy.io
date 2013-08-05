---
template: layout.jade
---

# Custom steps

In order to fully integrate with your application, you will probably need to write your own browser control steps. To find out more about writing Cucumber steps, check out the Cucumber documentation. Essentially, you can specify a piece of text in your `feature` files that will cause a piece of code to be run.

The code for your steps should be in the `step_definitions` folder in your test folder.

## Example

We want to ensure that a particular element is always positioned less than 100px from the top of the page

Inside our test folder, we have this `test.feature` file:

    Feature: Website layout test

    Scenario: One thing above another
    Given I visit "http://csste.st/"
    Then "header" should be above 100px

And this is our `selectors.js`:

    module.exports = {
        "header": "h1",
        "body copy": "div.contain"
    };

In order to be able to use this in our test, we need to create the behind-the-scenes function that will match the step:

    Then "body copy" should be above 100px

### Step Definition

If you created your test folder using `hardy init`, there will be a step_definitions folder. If not, create one. Inside it, you'll need a new file which can be named anything. Here, we'll use `custom.js`.

This is the general structure required for a custom step file:

    module.exports = function() {
      var assert = require('assert')
      var selectors;

      yourFunction = function( elementName, property, value, callback) {
        var elementSelector = require( process.env['BINARYPATH'] + 'features /support /selectors.js')(elementName);
        message = '"' + elementName + '" should have ' + property + ' of ' + value;

        this.webDriverJSFunction( elementSelector, function(err, measuredValue) {
          if (err) {
            callback.fail(err)
          }

          // Test between value and measuredValue

          callback();
        });
      };
      this.Then(/^RegEx Matching Custom Step$/, yourFunction);
    };

At the moment, there is quite a lot of boilerplate but we'll see about improving that in the future.

## Final Step Definition

To avoid this being a lesson in JS, here's the final test step to be used in `custom.js`:

    module.exports = function() {
      console.log('Custom Steps Loaded');
      var assert = require('assert');
      var shouldBeAbove100;

      shouldBeAbove100 = function(elementName, callback) {
        var elementSelector = require( process.env['BINARYPATH'] + 'features/ support/ selectors.js')(elementName);
        var message = '"' + elementName + '" should be above 100px';
        this.getLocation( elementSelector, function(err, measuredValue) {
          if (err) {
            if (typeof err === "object") {
              err = JSON.stringify(err);
            }
            console.error("Hardy :: Failed to execute script, ", err);
            return callback.fail(err);
          }

          message += ", measured: " + measuredValue["y"];

          try {
            assert.equal(true, measuredValue['y'] &lt; 100, message);
          } catch (e) {
            return callback.fail(e.message);
          }

          callback();
        });
      };
      this.Then(/^"([^"]*)" should be above 100px$/, shouldBeAbove100);
    };