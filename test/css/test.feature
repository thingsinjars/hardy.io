Feature: Hardy website
Static (non-interactive) layout test on localhost

Scenario: Beta!
 Given I visit "http://0.0.0.0:8000/"
  Then "beta ribbon wrapper" should have "right" of "-3px"
   And "beta ribbon" should have "background-color" of "rgb(191, 220, 122)"