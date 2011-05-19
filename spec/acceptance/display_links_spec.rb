require File.expand_path(File.dirname(__FILE__) + '/acceptance_helper')

feature 'display links' do
  
  scenario 'no links' do
    visit "/"
    page.should have_content "No links yet"
  end
  
  scenario 'one or more links' do
    link = Factory(:link)
    visit "/"
    page.should have_content "1."
    page.should have_link("This guy copied my site", 
        :href => "http://www.reddit.com")
    page.should have_content "(reddit.com)"
    page.should have_content "by user1@example.com"
    page.should have_content "ago"
  end
end
