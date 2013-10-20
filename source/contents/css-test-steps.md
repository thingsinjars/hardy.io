---
template: layout.jade
---

# CSS testing steps

There are a few basic testing steps provided with Hardy that cover a lot of use cases. For complete test coverage, you will also need to write your own [custom steps](custom-steps.html) but we'll look at the defaults first.

## Tests

### `Then "<css selector>" should have "<css property>" of "<value>"`

Testing for equality in CSS values. When the property measured is a colour, the values (measured and expected) are both converted to RGBA to ensure consistency. There is also a small amount of variation allowed as some browsers calculate colours slightly differently. This tolerance level is very, very small and not usually noticable.

### `Then "<css selector>" should have "<css property>" of "<value>" or "<value>" or ...`

Same as the previous test but allows a few possible values. Useful if you want to ensure that all text element colours are from a predefined palette.

### `Then "<css selector>" should have "<css property>" of "<greater|less>" than "<value>"`

To make tests sturdier and more reliable, it is best to not be completely exact in measurement. This step allows you to name a minimum or maximum for any numerical value. Using two of these steps together, you can create a range of acceptable values.

### `Then "<css selector>" should have offset "<top or left>" of "<value>"`

Calculates the exact position of the element within the page and reports it back. This is measured regardless of the rules applied so that even if an element has `top: auto` for example, will still return the actual number of pixels from the top of the document.

### `Then "<css selector>" should look the same as before`

This step does an [image diff comparison](http://csste.st/techniques/image-diff.html) on the element supplied. This element could be anything from a single `li` to the entire page.

## Basic steps

These are the ones needed to open a web page and perform basic functionality. There are many more examples of these steps in the original [WebDriverJS project](https://github.com/Camme/webdriverjs) used behind-the-scenes in Hardy.

### `Given I visit "<web page URL>"`

Hopefully self-explanatory. Opens the specified page in the browser.

### `Given I wait for "<n>" seconds`

Allows for interactive testing. If a particular action takes a length of time, you can pause the test for that length of time. Note: using this too often will (predictably) slow down your test runs.

### `Given I wait for "<selector>" to be present`

Another helper for interactive testing. This will loop for a while (maximum of 5 seconds) until there is an element that matches the selector specified. If there isn't a match after 5 seconds, this fails.

### `Given the window size is "<width>" by "<height>"`

This step allows the browser size to be controlled. This can make testing responsive designs easy.

### `Then I enter '<string>' into '<css selector>'`

This behaves as though the user typed the string into the input identified by the selector.

### `Then I submit the form '<css selector>'`

Equivalent to pressing submit on the form identified by the selector.

There is already quite a lot that can be accomplished with these steps but you will probably also need to write your own [custom steps](custom-steps.html) for complete coverage.
