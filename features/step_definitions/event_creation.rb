Given /^admin visits the event creation page of his account$/ do
  visit admin_path
end
When /^he creates an existing event$/ do
  click_button "Create"
end
Then /^he should see an error message$/ do
  expect(page).to have_selector('div.alert.alert-error')
end
When /^he creates a new event with out existing name$/ do
	@event = Event.new(eventname: "Example Event", category: "Example category", registrationopen: "Example date", registrationclose: "Example date", registrationopen: "Example date", auditionopen: "Example date", auditionclose: "Example date", eventopen: "Example date", eventclose: "Example date", description: "Some description", rules: "Some rules" )
  fill_in "Event Name",    with: @event.eventname
  fill_in "Category", with: @event.category
  fill_in "Registration open", with: @event.registrationopen
  fill_in "Registration close", with: @event.registrationclose
  fill_in "Audition open", with: @event.auditionopen
  fill_in "Audition close", with: @event.auditionclose
  fill_in "Event open", with: @event.eventopen
  fill_in "Event close", with: @event.eventclose
  fill_in "Description", with: @event.description
  fill_in "Rules", with: @event.rules
  click_button "Create"
end
Then /^he should see a pop up message, redirects to the same page$/ do
	visit admin_path
end
