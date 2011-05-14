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
  
  context 'when has url domain without http' do
    before { @link.url = "www.reddit.com" }
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
