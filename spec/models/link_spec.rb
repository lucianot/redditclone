require 'spec_helper'

describe Link do
  it 'is valid with valid attributes' do
    link = Link.new :title => "This guy copied my site", 
                    :url => "www.reddit.com"
    link.should be_valid
  end
  
  it 'is invalid without a title' do
    link = Link.new :title => nil, 
                    :url => "www.reddit.com"
    link.should_not be_valid
  end

  it 'is invalid without a url' do
    link = Link.new :title => "This guy copied my site", 
                    :url => nil
    link.should_not be_valid
  end
end
