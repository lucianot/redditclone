require File.expand_path(File.dirname(__FILE__) + '/acceptance_helper')

feature 'sign up' do
  scenario 'successful' do
    sign_up_new_user
    page.should have_content "Welcome! You have signed up successfully"
  end
  
  scenario 'failed' do
    visit "/"
    click_link 'Sign up'
    click_button 'Sign up'
    page.should have_content "prohibited this user from being saved"
  end
end

feature 'login' do
  scenario 'successful' do
    sign_up_new_user
    click_link 'Sign out'
    log_in_user
    page.should have_content "Signed in successfully"
  end
  
  scenario 'factory successful' do
    user = Factory(:user)
    log_in_user
    page.should have_content "Signed in successfully"
  end

  scenario 'failed' do
    log_in_user
    page.should_not have_content "Signed in successfully"
  end
end
  
feature 'logout' do
  scenario 'successful' do
    sign_up_new_user
    click_link 'Sign out'
    page.should have_content "Signed out successfully"
  end

end