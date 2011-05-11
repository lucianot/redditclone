require 'spec_helper'

describe Link do
  before(:each) do
    @link = Link.new(:title => "This guy copied my site", 
                     :url => "www.reddit.com")
  end
  
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
end
