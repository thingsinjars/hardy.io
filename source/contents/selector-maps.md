---
template: layout.jade
---

# Selector maps

Rather than maintain test files filled with repeated CSS selectors, you can create a file that maps a human-friendly name to the CSS selector of the element you want to test.

Edit the file `selectors/selectors.js` to look like this:

    module.exports = {
		"standard paragraph": "section > p"
	};

Now you can update `test.feature` to use this selector:

    Feature: Website layout test
    As a user I want visual consistency on the http://csste.st/ website

	Scenario: Content layout
	Given I visit "http://csste.st/"
	Then "standard paragraph" should have "color" of "rgb(68, 68, 68)"

You can now run the same test and get the same result.

<pre><code><span>~/myfirsttest</span> hardy .

Hardy v0.0.2
CSS Utils Steps Loaded
CSS Steps Loaded
Generic Steps Loaded
Loading browser firefox
...Shutting down browser


1 scenario (1 passed)
3 steps (3 passed)
firefox success
<span>~/myfirsttest</span></code></pre>

More importantly, you can reuse the human-friendly element description as many times as you want.

    Feature: Website layout test
	As a user I want visual consistency on the http://csste.st/ website

	Scenario: Content layout
	Given I visit "http://csste.st/"
	Then "standard paragraph" should have "color" of "rgb(68, 68, 68)"
	And "standard paragraph" should have "font-size" of "16px"
	And "standard paragraph" should have "display" of "block"

If you ever have to change the selector, you only need to update the `selectors/selectors.js` file and all the references are still valid.