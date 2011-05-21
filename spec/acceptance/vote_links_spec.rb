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
    end
    
  end
end
