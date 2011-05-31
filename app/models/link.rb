class Link < ActiveRecord::Base
  #Associations
  belongs_to :submitter, :class_name => 'User',
                         :foreign_key => 'user_id'
  has_many :votes, :dependent => :destroy
  
  #Validations
  validates :title, :presence => true
  validates :url, :presence => true
  validates_url_format_of :url,
                          :message => 'is completely unacceptable'
  validates :submitter, :presence => true
  
  #Callbacks
  before_validation :append_url, :only => :url
  
  #Named scopes
  scope :top, order('points DESC')
  
  
  def update_points
   self.update_attribute :points, score = self.votes.sum(:value)
   score
  end
  # def update_points
  #   score = self.votes.map {|vote| vote.value}.sum
  #   self.points = score
  #   self.save!
  #   score
  # end
  
  def vote_by(user)
    self.votes.find_by_user_id(user).try(:value)
  end
  # def vote_by(user)
  #   if user
  #     vote = self.votes.find_by_user_id(user.id)
  #     vote.value if vote
  #   end
  # end
  
  def clean_url
    #use try instead for nil?
    unless self.url.nil?
     parsed_url = URI.parse(self.url).host.sub(/\Awww\./, '')
    else
      nil
    end
  end
  
  private

  def append_url
    self.url = "http://#{self.url}" if self.url && self.url !~ %r(^https?://)
  end
  # def append_url
  #   regex = Regexp.new(%r{\Ahttps?://}i)
  #   # use try instead for nil?
  #   unless self.url.nil? or self.url.match(regex)
  #     self.url = "http://#{self.url}"
  #   end
  # end
end
