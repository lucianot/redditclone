class Link < ActiveRecord::Base
  belongs_to :submitter, :class_name => 'User',
                         :foreign_key => 'user_id'
  has_many :votes, :dependent => :destroy
  
  validates :title, :presence => true
  validates :url, :presence => true
  validates_url_format_of :url,
                          :message => 'is completely unacceptable'
  validates :submitter, :presence => true
  
  before_validation :append_url, :only => :url
  
  def points
    self.votes.map {|vote| vote.value}.sum
  end
  
  def upvote(voter)
    vote = voter.votes.create!(:link => self, :value => 1) 
  end
  
  def downvote(voter)
    vote = voter.votes.create!(:link => self, :value => -1) 
  end
  
  def voted_by?(user)
    if user
      self.votes.find_by_user_id(user.id)
    else
      nil
    end
  end
  
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
    regex = Regexp.new(%r{\Ahttps?://}i)
    # use try instead for nil?
    unless self.url.nil? or self.url.match(regex)
      self.url = "http://#{self.url}"
    end
  end
end
