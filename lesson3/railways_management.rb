class Station
  attr_reader :name
  
  def initialize(name)
    @name = name
  end

  def arrive_train
  end

  def trains
  end
  
  def trains_by_type
  end

  def depart_train
    
  end
end

class Route
  attr_reader :start, :end_route
  attr_accessor :stations

  def initialize(start, end_route)
    @start = start
    @end_route = end_route
    @stations = []
  end

  def add_station(station)
    self.stations << station
  end

  def remove_station(station)
    self.stations.delete(station)
  end 
end

class Train
  attr_reader :number, :is_passenger
  attr_accessor :wagons, :speed

  def initialize(number, is_passenger = true, wagons)
    @number = number
    @is_passenger = is_passenger
    @wagons = wagons
  end

  def go(speed)
    self.speed = speed
  end

  def stop
    self.speed = 0
  end

  def add_wagon
    self.wagons += 1 if self.speed == 0  
  end

  def remove_wagon
    self.wagons -= 1 if self.speed == 0  
  end
end