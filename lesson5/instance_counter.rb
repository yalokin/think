module InstanceCounter
  module ClassMethods  
    @@instances = 0
    
    def self.instances 
      @@instances
    end
  end

  module InstanceMethods
    protected
    def register_instance
      @@instances += 1
    end
  end
end