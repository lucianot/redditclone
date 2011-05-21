require File.expand_path(File.dirname(__FILE__) + '/acceptance_helper')

feature 'authenticate' do
  
  context 'sign up' do
  
    scenario 'valid' do
      sign_up_new_user
      page.should have_content "Welcome! You have signed up successfully"
    end
  
    scenario 'invalid' do
      visit "/"
      click_link 'Sign up'
      click_button 'Sign up'
      page.should have_content "prohibited this user from being saved"
    end
  end

  context 'login' do

    scenario 'valid' do
      user = Factory(:user)
      log_in(user)
      page.should have_content "Signed in successfully"
    end

    scenario 'invalid' do
      user = Factory(:user)
      user.email = 'unregistered@example.com'
      log_in(user)
      page.should_not have_content "Signed in successfully"
    end
  end
  
  context 'logout' do
    scenario 'successful' do
      sign_up_new_user
      click_link 'Sign out'
      page.should have_content "Signed out successfully"
    end
  end
end