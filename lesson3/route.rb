class Route
  attr_reader :stations

  def initialize(start, end_route)
    @stations = [start, end_route]
  end

  def add_station(station)
    @stations.insert(-2, station)
  end

  def remove_station(station)
    if station != @stations[0] && station != @stations[-1]
      @stations.delete(station)
    end
  end
end