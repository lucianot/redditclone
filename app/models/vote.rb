class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :link
  
  validates :user, :presence => true
  validates :link, :presence => true
  validates :value, :inclusion => { :in => [-1, 0, 1] }
end
