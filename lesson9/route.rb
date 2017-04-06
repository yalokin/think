require_relative 'validation'
class Route
  include Validation

  @@routes = {}

  def self.find(name)
    @@routes[name]
  end

  def self.all
    @@routes
  end

  attr_reader :stations, :name

  def initialize(start_station, end_station)
    @stations = [start_station, end_station]
    validate!
    @name = "#{start_station.name}-#{end_station.name}"
    @@routes[@name] = self
  end

  def add_station(station)
    @stations.insert(-2, station)
  end

  def remove_station(station)
    @stations.delete(station) if station != @stations[0] && station != @stations[-1]
  end

  protected

  def validate!
    raise 'Stations do not exist' if @stations[0].nil? || @stations[-1].nil?
    raise 'Passed objects are not class station' unless @stations[0].instance_of?(Station) || @stations[-1].instance_of?(Station)
    true
  end
end
