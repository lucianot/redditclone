class Vote < ActiveRecord::Base
  belongs_to :voter, :class_name => 'User',
                     :foreign_key => 'user_id'
  belongs_to :link
  
  validates :voter, :presence => true
  validates :link_id, :presence => true,
                      :uniqueness => { :scope => :user_id }
  validates :value, :inclusion => { :in => [-1, 1] }
end
