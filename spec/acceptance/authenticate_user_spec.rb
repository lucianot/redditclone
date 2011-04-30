require File.expand_path(File.dirname(__FILE__) + '/acceptance_helper')

feature 'sign up' do
  scenario 'sign up successful' do
    visit "/"
    click_link 'Sign up'
    fill_in 'Login', :with => 'user@example.com'
    fill_in 'Password', :with => 'password'
    fill_in 'Confirm password', :with => 'password'
    click_button 'OK'
    page.should have_content "New user created"
  end
end

  # 
  #   scenario 'sign up failed' do
  #   end
  # end
  # 
  # feature 'login' do
  #   scenario 'login successful' do
  #   end
  # 
  #   scenario 'login failed' do
  #   end
  # end
  # 
  # feature 'logout' do
  #   scenario 'logout successful' do
  #   end
  # 
  #   scenario 'logout failed' do
  #   end
  # end