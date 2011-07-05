module Insight
  
  module CRM
  
    module Callbacks
    
      module Account
      
        def self.included(base)
          base.class_eval do
            after_create :create_crm_account
          end
        
          protected
        
            def create_crm_account
              account         = CRM::Models::Account.new
              account.name    = name
              account.user_id = 1
              account.save
              self.update_attribute(:crm_id, account.id)
            end
                    
        end
      
      end
    
    end
  
  end
  
end