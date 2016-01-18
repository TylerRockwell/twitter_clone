Feature: Users

  Scenario: As a User I want to see my bio
    Given I am logged in with email "test@example.com" and password "password"
    When I visit my profile page
    Then I should see "About me"
      And I should see "My followers"

  Scenario: As a User I want to change my bio
    Given I am logged in with email "test@example.com" and password "password"
    When I change my bio to "I like turtles"
    Then I should see "Your account has been updated"
      And I should see my bio has been updated to "I like turtles"

  Scenario: As a User I want to view another user's bio
    Given I am logged in with email "test@example.com" and password "password"
    When I visit the profile of "zorldo"
    Then I should see "zorldo"
