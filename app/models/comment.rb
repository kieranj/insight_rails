class Comment < ActiveResource::Base
  
  headers["X-ApiKey"] = Insight.configuration.api_key
  
  self.site = Insight.configuration.fat_free_url + "/issues/:issue_id"
  
  # def issue
  #   Issue.find(issue_id)
  # end
  
end