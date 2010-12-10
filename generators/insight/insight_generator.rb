class InsightGenerator < Rails::Generator::Base
  
  def manifest
    record do |m|
      m.directory File.join("config", "initializers")
      m.file      "insight.rb", "config/initializers/insight.rb"
    end
  end
  
end