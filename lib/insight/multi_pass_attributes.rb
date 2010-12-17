module Insight
  
  module MultiPassAttributes
    
    def self.included(base)
      base.extend(ClassMethods)
    end

    def multipass
       @multipass ||= self.class.multipass.encode({
         :id         => id,
         :email      => email,
         :title      => title,
         :first_name => firstname,
         :last_name  => lastname,
         :crm_id     => crm_id,
         :expires    => 30.minutes.from_now
       })
     end
    
     module ClassMethods
      
       def multipass
         # @multipass ||= MultiPass.new(FatFreeAuth.configuration.site_name, FatFreeAuth.configuration.secret)
         @multipass ||= MultiPass.new('fatfree', 'abc')
       end
       
     end
       
  end

end
