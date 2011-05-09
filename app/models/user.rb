class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessor :first_name, :last_name
  # validates :first_name, { :presence => true, :format => { :with => %r{ˆ[A-Z].+} } }

  def full_name
    "#{first_name} #{last_name}"
  end
end
