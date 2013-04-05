require 'spec_helper'

feature "Login" do
  background do
    Smithy::User.create!(:email => "user@example.com", :password => 'secret123', :password_confirmation => 'secret123')
  end

  scenario "Logging in with correct credentials" do
    visit smithy.login_path
    within("#session") do
      fill_in 'Login', :with => 'user@example.com'
      fill_in 'Password', :with => 'secret123'
    end
    press_button 'Login'
    page.should have_content 'Success'
  end

end
