require "insight"
require "rails"

module Insight
  
  class Engine < ::Rails::Engine
    
    engine_name :insight
    
    rake_tasks do
      load File.join(File.dirname(__FILE__), "railties", "tasks.rake")
    end
    
  end
  
end