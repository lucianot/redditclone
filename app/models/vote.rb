class Vote < ActiveRecord::Base
  #Associations
  belongs_to :voter, :class_name => 'User',
                     :foreign_key => 'user_id'
  belongs_to :link
  
  #Validations
  validates :voter, :presence => true
  validates :link_id, :presence => true,
                      :uniqueness => { :scope => :user_id }
  validates :value, :inclusion => { :in => [-1, 1] }
  
  #Callbacks
  after_create :update_vote_cache
  after_destroy :update_vote_cache
  
  
  def update_vote_cache
    self.link.update_points
  end
  
end
