require File.expand_path(File.dirname(__FILE__) + '/acceptance_helper')

feature 'voting' do
  
  context 'logged in' do
  
    before(:each) do
      link = Factory(:link)
      voter = Factory(:user)
      log_in(voter)
    end
    
    scenario 'upvote link' do
      visit '/'
      expect do
        click_link 'upvote=>1'
      end.to change {Vote.count}.by(1)
      page.should have_content 'Link upvoted.'
      page.should have_css("img[alt='upvote=>1']") 
      page.should_not have_link 'upvote=>1'
    end   
    
    scenario 'downvote link' do
      visit '/'
      expect do
        click_link 'downvote=>1'
      end.to change {Vote.count}.by(1)
      page.should have_content 'Link downvoted.'
      page.should have_css("img[alt='downvote=>1']")
      page.should_not have_link 'downvote=>1'
    end 
    
    scenario 'remove upvote' do
      visit '/'
      click_link 'upvote=>1'
      expect do
        click_link 'remove_vote=>1'
      end.to change {Vote.count}.by(-1)
      page.should have_content 'Vote removed.'
      page.should have_link 'upvote=>1'
      page.should have_link 'downvote=>1'
    end
    
    scenario 'remove dowvote' do
      visit '/'
      click_link 'downvote=>1'
      expect do
        click_link 'remove_vote=>1'
      end.to change {Vote.count}.by(-1)
      page.should have_content 'Vote removed.'
      page.should have_link 'upvote=>1'
      page.should have_link 'downvote=>1'
    end
  end
  
  context 'logged out' do
    
    before(:each) do
      link = Factory(:link)
    end

    scenario 'upvote link' do
      visit '/'
      click_link 'upvote=>1'
      page.should have_content "Forgot your password?"
    end    
    
    scenario 'downvote link' do
      visit '/'
      click_link 'downvote=>1'
      page.should have_content "Forgot your password?"
    end
  end
end
