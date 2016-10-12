require 'spec_helper'
require 'rails_helper'

feature "the signup process" do

  scenario "has a new user page" do
    visit "/users/new"
    expect(page.status_code).to eq(200)
    expect(page).to have_content("New User")
  end

  feature "signing up a user" do

    scenario "shows username on the homepage after signup" do
      sign_up_eren_yaeger
      expect(page).to have_content("eren_yaeger")
    end

  end

end

feature "logging in" do

  before(:each) do
    sign_up_eren_yaeger
    logout
  end

  scenario "shows username on the homepage after login" do
    sign_in_eren_yaeger
    expect(page).to have_content("eren_yaeger")
  end

end

feature "logging out" do
  
  before(:each) do
    sign_up_eren_yaeger
    logout
  end

  scenario "begins with a logged out state" do
    visit new_session_path
    expect(page).to_not have_content("eren_yaeger")
    expect(page).to have_button("Sign In")
  end

  scenario "doesn't show username on the homepage after logout" do
    sign_in_eren_yaeger
    click_button "Sign Out"
    expect(page).to_not have_content("eren_yaeger")
    expect(page).to have_button("Sign In")
  end


end
