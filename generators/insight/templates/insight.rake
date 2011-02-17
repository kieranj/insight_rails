namespace :insight do
  
  desc "Generate CRM Contacts"
  task :generate_crm_contacts => :environment do
    Account.find_each do |account|
      name = (account.respond_to?(:name) ? account.name + " " + account.id.to_s : account.site_name + " " + account.id.to_s)
      crm_account = Insight::CRM::Models::Account.new(:name => name)
      crm_account.save
      account.update_attribute(:crm_id, crm_account.id)
      
      account.users.each do |user|
        crm_user            = Insight::CRM::Models::Contact.new
        crm_user.title      = user.title      if user.respond_to?(:title)
        crm_user.first_name = user.firstname  if user.respond_to?(:firstname)
        crm_user.first_name = user.first_name if user.respond_to?(:first_name)
        crm_user.last_name  = user.lastname   if user.respond_to?(:lastname)
        crm_user.last_name  = user.last_name  if user.respond_to?(:last_name)
        crm_user.email      = user.email      if user.respond_to?(:email)
        crm_user.save
        
        user.update_attribute(:crm_id, crm_user.id)
      end
    end
  end
  
end