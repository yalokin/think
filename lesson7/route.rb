require_relative 'validate'
class Route 
  attr_reader :stations

  include Validate

  def initialize(start_station, end_station)
    @stations = [start_station, end_station]
    validate!
  end

  def add_station(station)
    @stations.insert(-2, station)
  end

  def remove_station(station)
    if station != @stations[0] && station != @stations[-1]
      @stations.delete(station)
    end
  end

  protected

  def validate!
    raise "Stations do not exist" if @stations[0].nil? || @stations[-1].nil?
    raise "Passed objects are not class train" unless (@stations[0].instance_of?(Station) || @stations[-1].instance_of?(Station))
    true
  end
end