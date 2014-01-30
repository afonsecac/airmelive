Given /^a user visits the signin page$/ do
  visit index_path
end

When /^the user click signin button$/ do
  click_button "signinButton"
end

Then /^they should see their profile page$/ do
  expect(page).to have_title(@user.name)
end

Then /^they should see a signout link$/ do
  expect(page).to have_link('Log out', href: index_path)
end