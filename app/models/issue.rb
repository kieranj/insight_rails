class Issue < ActiveResource::Base
  
  headers["X-ApiKey"] = Insight.configuration.api_key
  
  self.site           = Insight.configuration.fat_free_url
  self.format         = :xml
  
  include Gravtastic
  gravtastic :user_email
  
  def to_param
    "#{slug}-#{id}"
  end
  
  def contact
    @contact ||= begin
      if !contact_id.nil?
        super
      else
        nil
      end
    end
  end
  
  def user_name
    if contact_id.present?
      contact.username
    else
      super
    end
  end
  
  def user_email
    if contact_id.present?
      contact.email
    else
      super
    end
  end
  
end