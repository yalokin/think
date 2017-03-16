class Station
  attr_reader :name
  attr_accessor :trains
  
  def initialize(name)
    @name = name
    @trains = []
  end

  def arrive_train(train)
    @trains << train
  end

  def trains
    @trains.each do |train|
      puts train.number if train.speed == 0
    end
  end
  
  def trains_by_type

  end

  def depart_train(train)
    @trains.delete(train)  
  end
end

class Route
  attr_accessor :stations

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

  def stations
    @stations.each do |station|
      puts station.name
    end
  end
end

class Train
  attr_reader :number, :is_passenger, :speed
  attr_accessor :wagons, :route

  def initialize(number, is_passenger = true, wagons)
    @number = number
    @is_passenger = is_passenger
    @wagons = wagons
    @speed = 0
  end

  def go(speed)
    @speed = speed
  end

  def stop
    @speed = 0
  end

  def add_wagon
    @wagons += 1 if self.speed == 0  
  end

  def remove_wagon
    @wagons -= 1 if self.speed == 0  
  end

  def move_next
  end

  def move_previous
  end

  def next
  end

  def previous
  end
end

belgorod = Station.new('Belgorod')
moscow = Station.new('Moscow')
kursk = Station.new('Kursk')
orel = Station.new('Orel')

train1 = Train.new(3100, 15)
train2 = Train.new(3110, false, 30)
train3 = Train.new(7700, 18)
train4 = Train.new(7710, false, 40)
train5 = Train.new(4600, 16)
train7 = Train.new(4610, false, 25)

belgorod.arrive_train(train1)
belgorod.arrive_train(train2)
belgorod.arrive_train(train3)
belgorod.arrive_train(train4)
#belgorod.trains

belgorod.depart_train(train4)
train3.go(60)
#belgorod.trains

bel_msk = Route.new(belgorod, moscow)
bel_msk.add_station(kursk)
bel_msk.add_station(orel)
#bel_msk.stations
bel_msk.remove_station(orel)
#bel_msk.stations

train3.stop
#puts train3.speed
#puts train3.wagons
train3.add_wagon
train3.add_wagon
train3.remove_wagon
#puts train3.wagons

train3.route = bel_msk

p train3.route.stations