require 'spec_helper'

describe Link do
  
  before(:each) do
    @user = Factory(:user)
    @attr = { :title => "This guy copied my site", 
              :url => "www.reddit.com" }
    @link = @user.links.create!(@attr)
  end
  
  # describe "user associations" do
  #       
  #   it 'has a user attribute' do
  #     @link.should respond_to(:user)
  #   end
  #   
  #   it 'should have the right associated user' do
  #     @link.user_id.should == @user.id
  #     @link.user.should == @user
  #   end
  # end
  
  describe "validations" do
  
    it 'is valid with valid attributes' do
      @link.should be_valid
    end
  
    it 'is invalid without a title' do
      @link.title = nil
      @link.should_not be_valid
    end

    it 'is invalid without a url' do
      @link.url = nil
      @link.should_not be_valid
    end
  
    it 'is invalid without a valid url' do
      @link.url = "invalid_url"
      @link.should_not be_valid
    end
  
    it 'is invalid without a user' do
      @link.user = nil
      @link.should_not be_valid
    end
  end
end
