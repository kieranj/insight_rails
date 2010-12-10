module Insight
  
  class Configuration
    
    attr_accessor :fat_free_url, :api_key, :layout, :recaptcha_public_key, :recaptcha_private_key
    
    def initialize
      @fat_free_url          = "http://localhost"
      @api_key               = nil
      @layout                = "support_layout"
      @recaptcha_public_key  = nil
      @recaptcha_private_key = nil
    end
    
  end
  
  class << self

    attr_accessor :configuration

    def configure
      self.configuration ||= Configuration.new
      yield(configuration)
    end
    
  end
  
end