module Validation

  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods

    def validate(attr_name, type, arg = nil)
      @validations ||= []
      @validations << [attr_name.to_sym, type.to_sym, arg]
    end

  end

  module InstanceMethods

    def validate!
      self.class.instance_variable_get(:@validations).each do |validation|
        send validation[1], instance_variable_get("@#{validation[0]}"), validation[2]
      end
    end

    def valid?
      validate!
      true
    rescue
      false
    end

    private

    def presence(attr, *arg)
      raise "#{attr} is nil or empty" if attr.to_s.empty?
    end

    def format(attr, regexp)
      raise "Wrong format of argument: #{attr}" unless attr =~ regexp
    end

    def type(attr, type)
      raise "Wrong type of argument: #{attr}" unless attr.is_a?(type)
    end
  end
end
