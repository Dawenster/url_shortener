class Url < ActiveRecord::Base
  validates :original_url, :format => { :with => /^(http|https|ftp)\:\/\/[a-zA-Z0-9\-\.]+\.[a-zA-Z]{2,3}(:[a-zA-Z0-9]*)?\/?([a-zA-Z0-9\-\._\?\,\'\/\\\+&amp;%\$#\=~])*[^\.\,\)\(\s]$/
}

  before_create :create_shortened_url
  before_save :increment_counter

  def create_shortened_url
    self.shortened_url = SecureRandom.urlsafe_base64(6)
  end

  def increment_counter
    self.counter += 1 if self.shortened_url
  end
end
