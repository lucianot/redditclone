class Link < ActiveRecord::Base
  belongs_to :user
  
  validates :title, :presence => true
  validates :url, :presence => true
  validates_url_format_of :full_url,
                          :message => 'is completely unacceptable'
  validates :user, :presence => true
  
  def full_url
    regex = Regexp.new(%r{\Ahttps?://}i)
    # use try instead?
    if self.url.nil?
      nil
    elsif self.url.match(regex)
      self.url
    else
      "http://#{self.url}"
    end
  end
  
  def clean_url
    #use try instead?
    unless full_url.nil?
      parsed_url = URI.parse(self.full_url).host.sub(/\Awww\./, '')
    else
      nil
    end
  end
end
