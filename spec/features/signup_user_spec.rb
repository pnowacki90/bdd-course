require 'rails_helper'

RSpec.feature 'Signup user' do
  scenario 'valid credentials' do
    visit '/'
    click_link 'Sign Up'
    fill_in 'Email', with: "user@wp.pl"
    fill_in 'Password', with: "password"
    fill_in 'Password confirmation', with: "password"
    click_button 'Sign up'
    expect(page).to have_content("Welcome! You have signed up successfully.")
  end
  
  scenario "invalid credentials" do
    visit '/'
    click_link 'Sign Up'
    fill_in 'Email', with: ""
    fill_in 'Password', with: ""
    fill_in 'Password confirmation', with: ""
    click_button 'Sign up'
    #expect(page).to have_content("Something is not right")
  end
end