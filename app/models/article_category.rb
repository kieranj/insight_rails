class ArticleCategory < ActiveResource::Base
  
  headers["X-ApiKey"] = Insight.configuration.api_key
  
  self.site           = Insight.configuration.fat_free_url
  self.format         = :xml
  
  def to_param
    slug
  end
  
end