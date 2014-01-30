Given (/^a user visits the upcoming events page$/)  do
   # visit upcomingevents_path
   visit '/upcomingevents'
end
When(/^the user tries to participate event$/) do

	 has_button?("participate")  
end

Then /^he should be added as a participant$ / do
  expect(page).to have_selector('div.alert.alert-error')
end
