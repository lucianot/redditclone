require File.expand_path(File.dirname(__FILE__) + '/acceptance_helper')

feature 'submit link' do
  
  context 'logged in' do
    
    scenario 'valid' do
      expect do
        user = Factory(:user)
        log_in(user)
        click_link "Submit link"
        fill_in "Title", :with => "Sample title"
        fill_in "Url", :with => "www.sampleurl.com"
        click_button "Create Link"
        page.should have_content "Link was successfully created."
      end.to change {Link.count}.by(1)
    end

    scenario 'invalid' do
      user = Factory(:user)
      log_in(user)
      click_link "Submit link"
      click_button "Create Link"
      page.should_not have_content "Link was successfully created."
    end
  end
  
  context 'logged out' do
    
    scenario 'redirect to sign in' do
      visit "/"
      click_link "Submit link"
      page.should have_content "Forgot your password?"
    end
  end
end