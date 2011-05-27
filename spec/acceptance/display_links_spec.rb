require File.expand_path(File.dirname(__FILE__) + '/acceptance_helper')

feature 'display links' do
  
  scenario 'no links' do
    visit "/"
    page.should have_content "No links yet"
  end
  
  scenario 'one or more links' do
    submitter = Factory(:user, :email => 'user@example.com')
    link = Factory(:link, :submitter => submitter, :points => 1)
    vote = Factory(:vote, :link => link)
    visit "/"
    page.should have_link 'upvote=>1'
    page.should have_link 'downvote=>1'    
    page.should have_content "1."
    page.should have_link("Sample link #1", 
        :href => "http://www.sampleurl1.com")
    page.should have_content "(sampleurl1.com)"
    page.should have_content '1 point'
    page.should have_content "by user@example.com"
    page.should have_content "ago"
  end
end
