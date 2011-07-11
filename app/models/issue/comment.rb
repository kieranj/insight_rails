class Issue::Comment < ActiveResource::Base
  
  headers["X-ApiKey"] = Insight.configuration.api_key
  
  self.site           = Insight.configuration.fat_free_url + "/issues/:issue_id"
  self.format         = :xml

  include Gravtastic
  gravtastic :user_email
  
  def user_name
    if commenter_id
      commenter.username
    else
      super
    end
  end
  
  def user_email
    if commenter_id
      commenter.email
    else
      super
    end
  end
  
end