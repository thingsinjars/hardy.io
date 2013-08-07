Feature: Hardy website
Static (non-interactive) layout test on localhost

Scenario: Beta!
 Given I visit "http://127.0.0.1:8000/"
  Then "beta ribbon wrapper" should have "left" of "0px"
  Then "beta ribbon wrapper" should have "width" of "0px"
   And "beta ribbon" should have "background-color" of "#BFDC7A"

Scenario: Grid layout
 Given I visit "http://127.0.0.1:8000/"
  And the window size is "320px" by "480px"
  Then "body" should look the same as before