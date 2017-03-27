require_relative 'validate'
class Station
  @@stations = {}

  def self.all
    @@stations
  end

  def self.find(name)
    @@stations[name]
  end

  attr_reader :name, :trains

  include Validate

  def validate!
    raise "Name of station can't be empty" if name.length == 0
    true
  end
    
  def initialize(name)
    @name = name
    validate!
    @trains = []
    @@stations[name] = self
  end

  def arrive_train(train)
    @trains << train
  end
  
  def trains_by_type(type)
     @trains.select { |train| train.type == type }
  end

  def depart_train(train)
    @trains.delete(train)  
  end
end