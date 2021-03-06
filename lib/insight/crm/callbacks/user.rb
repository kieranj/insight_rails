module Insight
  
  module CRM
  
    module Callbacks
    
      module User
      
        def self.included(base)
          base.class_eval do
            after_create :create_crm_contact
          end
        
          protected
        
            def create_crm_contact
              contact            = CRM::Models::Contact.new
              contact.attributes = crm_attributes
              contact.user_id    = 1
              contact.save
              self.update_attribute(:crm_id, contact.id)
            end
          
            def crm_attributes
              a = {}
              a[:title]      = title      if respond_to?(:title)
              a[:first_name] = firstname  if respond_to?(:firstname)
              a[:first_name] = first_name if respond_to?(:first_name)
              a[:last_name]  = lastname   if respond_to?(:lastname)
              a[:last_name]  = last_name  if respond_to?(:last_name)
              a[:email]      = email      if respond_to?(:email)
              a[:username]   = username   if respond_to?(:username)
              a
            end
                      
        end
      
      end
    
    end
  
  end
  
end