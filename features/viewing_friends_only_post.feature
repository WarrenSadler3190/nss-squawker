Feature: Viewing a friends-only post
  As a user
  I want to view global and friends-only posts
  And I don't want to see friends-only posts from users who are not my friends

  Background:
    Given a user named "bill"
    Given a user named "joe"
    Given a user named "sally"

    Given "bill" is friends with "joe"
    Given a friends-only squeek with content "This is for friends only." created by "bill"

  Scenario: A friend viewing the post
    Given I'm signed in as "joe"
    When I go to the homepage
    Then I should see "@bill: This is for friends only." within the squeeks feed

  Scenario: A user who is not a friend viewing the post
    Given I'm signed in as "sally"
    When I go to the homepage
    Then I should not see "@bill: This is for friends only." within the squeeks feed

  Scenario: An anonymous user should not she the friends-only squeekp
    When I go to the homepage
    Then I should not see "@bill: This is for friends only." within the squeeks feed