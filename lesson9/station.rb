require_relative 'validation'

class Station
  include Validation

  @@stations = {}

  def self.all
    @@stations
  end

  def self.find(name)
    raise 'Station does not exist' if @@stations[name].nil?
    @@stations[name]
  end

  def self.exist?(name)
    true if @@stations[name]
  end

  attr_reader :name, :trains

  validate :name, :presence

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
    @trains.each_value { |train| yield(train) }
  end

  def train_exists?(number)
    raise 'Train doesn not exists on a station' if @trains[number].nil?
    true
  end
end
