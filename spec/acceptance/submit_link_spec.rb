require File.expand_path(File.dirname(__FILE__) + '/acceptance_helper')

feature 'submit link' do
  scenario 'logged out' do
    pending
    click_link "Submit link"
    page.should have_content "Please sign in or sign up before continuing"
  end
  
  scenario 'logged in' do
    user = Factory.create(:user)
    log_in_user
    click_link "Submit link"
    fill_in "Title", :with => "This guy copied my site"
    fill_in "Url", :with => "www.reddit.com"
    click_button "Create Link"
    page.should have_content "Link was successfully created."
    Link.count.should == 1
  end
  
  scenario 'invalid' do
    pending
  end
end