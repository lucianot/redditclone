require 'spec_helper'

describe Vote do
  
  before(:each) do
    @link = Factory(:link)
    @voter = Factory(:user)
    @attr = { :value => 1, :voter => @voter, :link => @link }
    @vote = Vote.new(@attr)
  end
  
  subject { @vote }
  
  context 'when has valid attributes' do
    it { should be_valid }
  end
  
  context 'when link is empty' do
    before { @vote.link = nil }
    it { should_not be_valid }
  end
  
  context 'when voter is empty' do
    before { @vote.voter = nil }
    it { should_not be_valid }
  end
  
  context 'when value is valid' do
    it 'should be valid' do 
      should have_valid(:value).when(-1, 1)
    end
  end
  
  context 'when value is invalid' do
    it 'should not be valid' do 
      should_not have_valid(:value).when(-2, 2, -0.5, 0.5, 
                                        "string", "", nil)
    end
  end
  
  context 'when vote is not unique' do
    before { @vote.save }
    it 'should not be valid' do
      vote = Vote.new(@attr)
      vote.save
      vote.should_not be_valid
      vote.errors[:link_id].should include("has already been taken")
    end
  end
  
end
