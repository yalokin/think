module InstanceCounter
  
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods  
    @instances = 0
    
    def instances 
      @instances
    end

    def instances=(instances)
      @instances = instances
    end
  end

  module InstanceMethods
    protected
    def register_instance
      self.class.instances  += 1
    end
  end
end