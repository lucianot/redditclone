require File.expand_path(File.dirname(__FILE__) + '/acceptance_helper')

feature 'display links' do
  scenario 'no links' do
    pending
  end
  
  scenario 'one or more links' do
    link = Factory(:link)
    visit "/"
    page.should have_link "This guy copied my site"
  end
  
  scenario 'follow link' do
    pending 'find how to test external link'
    link = Factory(:link)
    visit "/"
    click_link "This guy copied my site"
    response.should redirect_to "http://www.reddit.com"
  end
end
