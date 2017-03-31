require_relative 'instance_counter'
require_relative 'validate'
class Station
  include Validate
  
  @@stations = {}

  def self.all
    @@stations
  end

  def self.find(name)
    raise "Station does not exists" if @@stations[name].nil?  
    @@stations[name]
  end

  attr_reader :name, :trains
    
  def initialize(name)
    @name = name
    validate!
    @trains = {}
    @@stations[name] = self
  end

  def arrive_train(train)
    @trains[train.number] = train
  end
  
  def trains_by_type(type)
     @trains.select { |train| train.type == type }
  end

  def depart_train(train)
    @trains.delete(train)  
  end

  def each_train
    @trains.each { |train| yield(train)}  
  end

  def train_exists?(number)
    raise "Train doesn not exists on a station" if @trains[number].nil?
    true
  end
  
  protected

  def validate!
    raise "Name of station can't be nil" if name.nil?
    raise "Name of station can't be empty" if name.length == 0
    true
  end
end