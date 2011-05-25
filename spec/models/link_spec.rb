require 'spec_helper'

describe Link do
  
  before(:each) do
    @submitter = Factory(:user)
    @attr = { :title => "This guy copied my site", 
              :url => "http://www.reddit.com" }
    @link = @submitter.links.create!(@attr)
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
  
  context 'when submitter is empty' do
    before { @link.submitter = nil }
    it { should_not be_valid }
  end
  
  context 'when link is destroyed' do
    it 'should destroy dependent votes' do
      @vote = Vote.create!(:voter => @submitter, :link => @link, :value => 1)
      expect do
        @link.destroy
      end.to change {Vote.count}.by(-1)
    end
  end
  
  describe "#vote_by(user)" do
    before do
      @other_link = Factory(:link)
      @voter = Factory(:user)
    end
    
    it 'returns 1 if upvote exists' do
      @vote = Factory(:vote, :link => @other_link, 
                             :voter => @voter, 
                             :value => 1)
      @other_link.vote_by(@voter).should == 1
    end
    
    it 'returns -1 if downvote exists' do
      @vote = Factory(:vote, :link => @other_link, 
                             :voter => @voter, 
                             :value => -1)
      @other_link.vote_by(@voter).should == -1
    end
    
    it 'returns nil if vote does not exist' do
      @other_link.vote_by(@voter).should == nil
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

end
