Feature: Register
    Scenario: Register with valid information
        Given I am not logged in
        When I go to the register page
        And I fill in fields with valid information
        And I press Create My Account button
        Then I should be registered and logged in

    Scenario: Register with invalid information
        Given I am not logged in
        When I go to the register page
        And I fill in fields with invalid information
        And I press Create My Account button
        Then I should not be registered and logged in
        And All Error messages should come up