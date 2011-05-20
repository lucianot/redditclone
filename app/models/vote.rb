class Vote < ActiveRecord::Base
  belongs_to :voter, :class_name => 'User',
                     :foreign_key => 'user_id'
  belongs_to :link
  
  validates :voter, :presence => true
  validates :link, :presence => true
  validates :value, :inclusion => { :in => [-1, 0, 1] }
end
