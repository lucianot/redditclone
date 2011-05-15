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
  
  context 'when url is valid' do
    it "should be valid" do 
      should have_valid(:url).when('www.google.com', 
                                    "http://www.google.com",
                                    "https://www.google.com",
                                    'www.google.com/extra')
    end
  end
  
  context 'when url is invalid' do
    it 'should not be valid' do
      should_not have_valid(:url).when('invalid_url', 
                                        ' ', 
                                        nil) 
    end
  end
  
  context 'when title is empty' do
    before { @link.title = nil }
    it { should_not be_valid }
  end
  
  context 'when user is empty' do
    before { @link.user = nil }
    it { should_not be_valid }
  end
  
  describe "#append_url" do
    it 'adds http to domain' do
      @link.url = 'www.google.com'
      @link.valid?
      @link.url.should == 'http://www.google.com'
    end
    
    #add https example
    it 'does nothing to complete URL' do
      @link.url = 'http://www.google.com'
      @link.valid?
      @link.url.should == 'http://www.google.com'
    end
  end
    
  describe "#clean_url" do
    it 'parses valid URLs' do
      @link.url = 'http://www.google.com/extrastuff'
      @link.clean_url.should == 'google.com'
    end
    
    #add more examples
    it 'returns nil for nil URLs' do
      @link.url = nil
      @link.clean_url.should be_nil
    end
  end
end
