Feature: Posts

  Scenario: As a User I can update my own posts
    Given I am logged in with email "test@example.com" and password "password"
      And I create a post that says "This is the bset post eva!!!"
    When I edit my post to say "This is the best post eva!!!"
    Then my post should be changed to say "This is the best post eva!!!"

  Scenario: As a User I cannot update others' posts
    Given I am logged in with email "test@example.com" and password "password"
      And Another user makes a post that says "You shall not change"
    When I try to edit that post
    Then I am redirected to my feed

  Scenario: As a User others can see when I favorite a post
    Given I am logged in with email "test@example.com" and password "password"
      And Another user makes a post that says "Woke up before noon today!"
    When I favorite that user's post
    Then I am listed on the post's show page
