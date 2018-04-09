require 'rails_helper'

RSpec.feature "Signing out users" do
  before do
    @john = User.create!(email: "john@example.com", password: "password")
    visit '/'
    click_link 'Sign In'
    fill_in "Email", with: @john.email
    fill_in "Password", with: @john.password
    click_button "Log in"
  end
  
  scenario "users signs out" do
    visit '/'
    click_link "Log Out"
    expect(page).to have_content('Signed out successfully')
    expect(page).not_to have_content('Log Out')
  end  
end