class Link < ActiveRecord::Base
  belongs_to :user
  
  validates :title, :presence => true
  validates :url, :presence => true, 
            :format => { :with => /((http|https):\/\/|[a-zA-Z0-9]+(\.[a-zA-Z0-9]+)+.*)$/ }
            # validates_url_format_of gem
  validates :user, :presence => true
end
