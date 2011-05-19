class Link < ActiveRecord::Base
  belongs_to :user
  has_many :votes
  
  validates :title, :presence => true
  validates :url, :presence => true
  validates_url_format_of :url,
                          :message => 'is completely unacceptable'
  validates :user, :presence => true
  
  before_validation :append_url, :only => :url
  
  def clean_url
    #use try instead for nil?
    unless self.url.nil?
      parsed_url = URI.parse(self.url).host.sub(/\Awww\./, '')
    else
      nil
    end
  end
  
  protected
  
  def append_url
    regex = Regexp.new(%r{\Ahttps?://}i)
    # use try instead for nil?
    unless self.url.nil? or self.url.match(regex)
      self.url = "http://#{self.url}"
    end
  end
end
