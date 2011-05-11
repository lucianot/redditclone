class Link < ActiveRecord::Base
  belongs_to :user
  
  validates :title, :presence => true
  validates :url, :presence => true     #insert format
  validates :user, :presence => true
end
