require 'spec_helper'

describe User do
  # it { should have_valid(:first_name).when('Luciano', 'Tom') }
  # it { should_not have_valid(:first_name).when(nil, '', 'tom') }
  # it { should have_valid(:phone_number).when('555-555-5555', '(555) 555-5555') }
  # it { should_not have_valid(:phone_number).when('123') }
  # it '#full_name' do
  #   user = User.new
  #   user.first_name = "Clark"
  #   user.last_name = "Kent"
  #   user.full_name.should == "Clark Kent"
  # end
    
  describe "link associations" do
        
    before(:each) do
      @user = User.create!( :email => "user@example.com",
                           :password => 'password')
    end    
        
    it 'should have a link attribute' do
      @user.should respond_to(:links)
    end
  end
end

