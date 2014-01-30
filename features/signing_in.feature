Feature: Signing in
  Scenario: Successful signin
    Given a user visits the signin page
    When the user click signin button
    Then they should see their profile page
      And they should see a signout link