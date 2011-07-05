require "rails/generators"
require "rails/generators/migration"

module Insight
    
    class InstallGenerator < Rails::Generators::Base
    
      include Rails::Generators::Migration

      def self.source_root
        @source_root ||= File.join(File.dirname(__FILE__), "templates")
      end

      def self.next_migration_number(dirname)
        if ActiveRecord::Base.timestamped_migrations
          Time.now.utc.strftime("%Y%m%d%H%M%S")
        else
          "%.3d" % (current_migration_number(dirname) + 1)
        end
      end

      def install
        copy_file "insight.rb",               "config/initializers/insight.rb"
        copy_file "insight.html.erb",         "app/views/layouts/insight_layout.rb"
        copy_file "_insight_footer.html.erb", "app/views/layouts/_insight_footer.html.erb"    
        copy_file "insight.sass",             "app/assets/stylesheets/insight.css.sass"
  
        migration_template "migrations/link_users_to_crm_contacts.rb", "db/migrate/link_users_to_crm_contacts.rb"
  
        inject_into_class "app/models/user.rb",    User,    "  include Insight::CRM::Callbacks::User\n"
        inject_into_class "app/models/account.rb", Account, "  include Insight::CRM::Callbacks::Account\n"
  
        readme "README"
      end
    
    end
    
end