require "jeweler"
require File.join(File.dirname(__FILE__), "lib", "insight", "version")

Jeweler::Tasks.new do |gem|
  gem.name        = "insight_rails"
  gem.summary     = "Customer Support and Knowledge Base"
  gem.description = "Customer Support and Knowledge Base"
  gem.email       = "support@invisiblelines.com"
  gem.homepage    = "http://github.com/kieranj/insight"
  gem.authors     = ["Kieran Johnson"]
  gem.files       = FileList["[A-Z]*", "{app,config,lib,rails}/**/*"]
  gem.add_dependency "rails", ">= 3.1.0.rc4"
  gem.add_dependency "recaptcha"
  gem.add_dependency "gravtastic"
end

Jeweler::GemcutterTasks.new