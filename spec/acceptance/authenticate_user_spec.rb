require File.expand_path(File.dirname(__FILE__) + '/acceptance_helper')

feature 'sign up' do
  scenario 'successful' do
    sign_up_new_user
    page.should have_content "Signed in as user@example.com"
  end
  
  scenario 'failed' do
    sign_up_new_user
    click_link "Sign out"
    sign_up_new_user
    page.should have_content "Email has already been taken"
  end
end

feature 'login' do
  scenario 'successful' do
    sign_up_new_user
    click_link 'Sign out'
    log_in_user
    page.should have_content "Signed in as user@example.com"
  end

  scenario 'failed' do
    log_in_user
    page.should_not have_content "Signed in as user@example.com"
  end
end
  
feature 'logout' do
  scenario 'successful' do
    sign_up_new_user
    click_link 'Sign out'
    page.should have_content "Sign in or Sign up"
  end

  # scenario 'failed' do
  #   sign_up_new_user
  #   click_link 'Sign out'
  # end
end