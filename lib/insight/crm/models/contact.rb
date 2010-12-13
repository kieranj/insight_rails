module Insight
  
  module CRM
    
    module Models
  
      class Contact < ActiveResource::Base
  
        self.site = Insight.configuration.fat_free_url
  
      end
      
    end
  
  end
  
end