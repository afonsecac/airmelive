Feature: Event participation

 
 Scenario: Successful event participation
    Given a user visits the upcoming events page
    When the user tries to participate event
    Then he should be added as a participant 
      