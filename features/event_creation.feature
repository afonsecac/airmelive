Feature: Event creation

Scenario: Unsuccessful event creation
	Given admin visits the event creation page of his account
	When he creates an existing event
	Then he should see an error message

Scenario: Successful event creation
	Given admin visits the event creation page in his account
	When he creates a new event with out existing name
	Then he should see a pop up message, redirects to the same page 