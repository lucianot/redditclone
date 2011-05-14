require File.expand_path(File.dirname(__FILE__) + '/acceptance_helper')

feature 'display links' do
  scenario 'no links' do
    visit "/"
    page.should have_content "No links yet"
  end
  
  scenario 'one or more links' do
    pending 'fix error'
    link = Factory(:link)
    visit "/"
    page.should have_link("This guy copied my site", 
        :href => "www.reddit.com")
    page.should have_content "(reddit.com)"
    page.should have_content "by user@example.com"
  end
  
  scenario 'one or more links no Factory' do
    user = Factory(:user)
    log_in_user
    click_link "Submit link"
    fill_in "Title", :with => "This guy copied my site"
    fill_in "Url", :with => "www.reddit.com"
    click_button "Create Link"
    page.should have_link("This guy copied my site", 
        :href => "http://www.reddit.com")
    page.should have_content "(reddit.com)"
    page.should have_content "by user@example.com"
  end
end
