module InstanceCounter
  module ClassMethods
    attr_accessor :instances
    
    @@instances = 0
    
    def self.instances 
      @@instances
    end 
  end

  module InstanceMethods
    protected
    def register_instance
      self.class.instances += 1
    end
  end
end