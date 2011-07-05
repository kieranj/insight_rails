class Lead < ActiveResource::Base
  
  headers["X-ApiKey"] = Insight.configuration.api_key
  
  self.site           = Insight.configuration.fat_free_url
  self.format         = :xml
  attr_accessor :password, :password_confirmation
  
  def validate
    self.errors.add(:email, "Is required")                         if email.nil?
    self.errors.add(:password, "Is required")                      if password.nil?
    self.errors.add(:password_confirmation, "Must match password") if password != password_confirmation
  end
  
end