module Insight
  
  module CRM
  
    module Callbacks
    
      module User
      
        def self.included(base)
          base.class_eval do
            after_create :create_crm_contact
            # after_update :update_crm_contact, :unless => :recording_last_activity?
          end
        
          protected
        
            def create_crm_contact
              contact            = CRM::Models::Contact.new
              contact.attributes = crm_attributes
              contact.user_id    = 1
              contact.save
              self.update_attribute(:crm_id, contact.id)
            end
          
            def update_crm_contact
              contact            = CRM::Models::Contact.find(crm_id)
              contact.attributes = crm_attributes
              contact.save
            end
          
            def crm_attributes
              a = {}
              a[:title]      = title     if respond_to?(:title)
              a[:first_name] = firstname if respond_to?(:firstname)
              a[:last_name]  = lastname  if respond_to?(:lastname)
              a[:email]      = email     if respond_to?(:email)
              a[:username]   = username  if respond_to?(:username)
              a
            end
            
            def recording_last_activity?
              respond_to?(:last_activity) && last_activity_changed?
            end
          
        end
      
      end
    
    end
  
  end
  
end