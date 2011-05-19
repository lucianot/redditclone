require 'spec_helper'

describe Vote do
  
  before(:each) do
    @link = Factory(:link)
    @voter = Factory(:user)
    @attr = { :value => 1, :user => @voter, :link => @link }
    @vote = Vote.create!(@attr)
  end
  
  subject { @vote }
  
  context 'when has valid attributes' do
    it { should be_valid }
  end
  
  context 'when link is empty' do
    before { @vote.link = nil }
    it { should_not be_valid }
  end
  
  context 'when user is empty' do
    before { @vote.user = nil }
    it { should_not be_valid }
  end
  
  context 'when value is valid' do
    it "should be valid" do 
      should have_valid(:value).when(-1, 0, 1)
    end
  end
  
  context 'when value is invalid' do
    it "should not be valid" do 
      should_not have_valid(:value).when(-2, 2, -0.5, 0.5, 
                                        "string", "", nil)
    end
  end
  
end
