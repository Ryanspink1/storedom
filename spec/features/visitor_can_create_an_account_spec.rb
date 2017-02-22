require 'rails_helper'

RSpec.feature "Visitor tries to create account" do
  context "providing valid credentials" do
    scenario  "account creation is successful" do
      visit new_user_path

      fill_in "Username", with: "NewUser"
      fill_in "Email", with: "NewUser@example.com"
      fill_in "Password", with: "password"
      fill_in "Password Confirmation", with: "password"
      click_on "Create Account"

    # fill_in "user[username]", with: "NewUser"
    #  fill_in "user[email]", with: "NewUser@example.com"
    #  fill_in "user[password]", with: "password"
    #  fill_in "user[password_confirmation]", with: "password"
    #  click_on "Create Account"

      user = User.last
      expect(current_path).to eq(user_path(user))

      within("h1.greeting") do
        expect(page).to have_content("Welcome NewUser!")
      end
    end
  end
end
