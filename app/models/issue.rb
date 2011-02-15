class Issue < ActiveResource::Base
  
  headers["X-ApiKey"] = Insight.configuration.api_key
  
  self.site           = Insight.configuration.fat_free_url
  
  include Gravtastic
  gravtastic :user_email
  
  def to_param
    "#{slug}-#{id}"
  end
  
  def contact
    if contact_id
      super
    else
      nil
    end
  end
  
  def user_name
    if contact_id
      contact.username
    else
      super
    end
  end
  
  def user_email
    if contact_id
      contact.email
    else
      super
    end
  end
  
end