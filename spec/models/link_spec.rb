require 'spec_helper'

describe Link do
  
  before(:each) do
    @user = Factory(:user)
    @attr = { :title => "This guy copied my site", 
              :url => "http://www.reddit.com" }
    @link = @user.links.create!(@attr)
  end

  subject { @link }
  
  context 'when has valid attributes' do
    it { should be_valid }
  end
  
  context 'when title is empty' do
    before { @link.title = nil }
    it { should_not be_valid }
  end
  
  context 'when url is empty' do
    before { @link.url = nil }
    it { should_not be_valid }
  end
  
  context 'when url is invalid' do
    before { @link.url = 'invalid_url' }
    it { should_not be_valid }
  end

  context 'when user is empty' do
    before { @link.user = nil }
    it { should_not be_valid }
  end
  
  describe "#host" do
    it 'parses valid URLs' do
      @link.url = 'http://www.google.com/extrastuff'
      @link.host.should == 'google.com'
    end
    
    it 'returns nil for invalid URLs' do
      @link.url = 'foobar'
      @link.host.should be_nil
    end
  end
  
  # describe "validations" do
  # 
  #   it 'is valid with valid attributes' do
  #     @link.should be_valid
  #   end
  # 
  #   it 'is invalid without a title' do
  #     @link.title = nil
  #     @link.should_not be_valid
  #   end
  # 
  #   it 'is invalid without a url' do
  #     @link.url = nil
  #     @link.should_not be_valid
  #   end
  # 
  #   it 'is invalid without a valid url' do
  #     @link.url = "invalid_url"
  #     @link.should_not be_valid
  #   end
  # 
  #   it 'is invalid without a user' do
  #     @link.user = nil
  #     @link.should_not be_valid
  #   end
  # end
  
  describe "append http to url" do
    pending
  end
end
