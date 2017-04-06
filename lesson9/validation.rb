module Validation

  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods

    def validate(attr_name, type, *args)
      @validations ||= []
      @validations << [attr_name.to_sym, type.to_sym, args[0]]
    end

  end

  module InstanceMethods

    def validate!
     # raise "No validations" if self.class.instance_variable_get(:@validations).nil?

      self.class.instance_variable_get(:@validations).each do |validation|
        send validation[1], validation[0], validation[2] unless validation[2].nil?
      end
    end

    def valid?
      validate!
    rescue
      false
    end

    private

    def presence(attr_name)
      raise "#{attr_name} is nil or empty" if var_value(attr_name).nil? || var_value(attr_name).to_s.empty?
    end

    def format(attr_name, regexp)
      raise "Wrong format of argument: #{attr_name}" unless var_value(attr_name) =~ regexp
    end

    def type(attr_name, type)
      raise "Wrong type of argument: #{attr_name}" unless var_value(attr_name).is_a?(type)
    end

    def var_value(attr_name)
      instance_variable_get("@#{attr_name}")
    end
  end
end
