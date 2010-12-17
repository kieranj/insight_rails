class InsightUser
  
  def initialize(multipass)
    @multipass_attributes = self.class.multipass.decode(multipass)
  end

  def method_missing(method, *args, &block)
    if @multipass_attributes.keys.include?(method)
      @multipass_attributes[method]
    else
      super
    end
  end
  
  def self.multipass
    @multipass ||= MultiPass.new('fatfree', 'abc')
  end
  
end