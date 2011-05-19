require File.expand_path(File.dirname(__FILE__) + '/acceptance_helper')

feature 'voting' do
  
  context 'logged in' do
  
    # before(:all) do
    #   @user = Factory(:user)
    #   link = Factory(:link)
    #   log_in_user
    # end
    
    scenario 'upvote link' do
      pending 'add to view'
      link = Factory(:link)
      log_in_user
      click_button "Upvote"
      page.should_not have_button("Upvote")
      # expect do
      #   click_button "Upvote"
      #   button.should be_disabled
      # end.to change {Votes.count}.by(1)
    end
    
  end
end
