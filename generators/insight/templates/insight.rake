namespace :insight do
  
  desc "Generate CRM Accounts"
  task :generate_crm_accounts => :environment do
    Account.find_each do |account|
      crm_account = Insight::CRM::Models::Account.new(:name => (account.respond_to?(:name) ? account.name : account.site_name))
      crm_account.save
      account.update_attribute(:crm_id, crm_account.id)
      
      account.users.each do |user|
        crm_user            = Insight::CRM::Models::Contact.new
        crm_user.title      = user.title     if user.respond_to?(:title)
        crm_user.first_name = user.firstname if user.respond_to?(:firstname)
        crm_user.last_name  = user.lastname  if user.respond_to?(:lastname)
        crm_user.email      = user.email     if user.respond_to?(:email)
        crm_user.username   = user.username  if user.respond_to?(:username)
        crm_user.save
        
        user.update_attribute(:crm_id, crm_user.id)
      end
    end
  end
  
end