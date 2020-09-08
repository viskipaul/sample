Feature: Login
    Scenario: Sign in with valid credentials
        Given I am not logged in
        When I go to the login page
        And I fill in email with "login@test.com"
        And I fill in password with "login_test"
        And I press Login
        Then I should be on the user home page
            
    Scenario: Sign in with invalid credentials
        Given I am not logged in
        When I go to the login page
        And I fill in wrong email and password
        And I press Login
        Then I should be returned on the login page