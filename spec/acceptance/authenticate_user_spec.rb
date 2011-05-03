require File.expand_path(File.dirname(__FILE__) + '/acceptance_helper')

feature 'sign up' do
  scenario 'successful' do
    sign_up_new_user
    page.should have_content "Signed in as user@example.com"
  end
  
  scenario 'unsuccessful' do
    sign_up_new_user
    click_link "Sign out"
    sign_up_new_user
    page.should have_content "Email has already been taken"
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