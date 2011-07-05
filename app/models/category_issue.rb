class CategoryIssue < ActiveResource::Base
  
  self.site         = Insight.configuration.fat_free_url + "/categories/:category_id"
  self.element_name = "issue"
  self.format       = :xml
  
  def to_param
    slug
  end

end