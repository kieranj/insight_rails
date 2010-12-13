require File.expand_path(File.dirname(__FILE__) + "/lib/insert_commands.rb")

class InsightGenerator < Rails::Generator::Base
  
  def manifest
    record do |m|
      m.directory          File.join("config", "initializers")
      m.file               "insight.rb", "config/initializers/insight.rb"
      
      m.migration_template "migrations/link_users_to_crm_contacts.rb",
                           "db/migrate",
                           :migration_file_name => "link_users_to_crm_contacts"
                           
      m.insert_into        "app/models/user.rb",    "include Insight::CRM::Callbacks::User"
      m.insert_into        "app/models/account.rb", "include Insight::CRM::Callbacks::Account"
      
      m.file               "insight.rake", "lib/tasks/insight.rake"
      
      m.directory          File.join("public", "stylesheets", "sass")
      m.file               "insight.sass", "public/stylesheets/sass/insight.sass"
      
      m.readme             "README"
    end
  end
  
end