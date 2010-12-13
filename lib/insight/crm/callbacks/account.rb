module Insight
  
  module CRM
  
    module Callbacks
    
      module Account
      
        def self.included(base)
          base.class_eval do
            after_create :create_crm_account
            after_update :update_crm_account
          end
        
          protected
        
            def create_crm_contact
              account         = CRM::Models::Account.new
              account.name    = name
              account.user_id = 1
              account.save
              self.update_attribute(:crm_id, account.id)
            end
          
            def update_crm_contact
              account      = CRM::Models::Account.find(crm_id)
              account.name = name
              account.save
            end
                    
        end
      
      end
    
    end
  
  end
  
end