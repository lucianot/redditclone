require File.expand_path(File.dirname(__FILE__) + '/acceptance_helper')

feature 'display links' do
  scenario 'no links' do
    pending
  end
  
  scenario 'one or more links' do
    link = Factory.create(:link)
    visit "/"
    page.should have_content "This guy copied my site"
  end
  
  scenario 'follow link' do
    pending
  end
end
