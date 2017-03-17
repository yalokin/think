class Train
  attr_reader :number, :speed, :count_carriages

  def initialize(number, type, count_carriages)
    @number = number
    @type = type
    @count_carriages = count_carriages
    @speed = 0
  end

  def speed_up(speed)
    @speed += speed
  end

  def stop
    @speed = 0
  end

  def add_carriage
    @count_carriages += 1 if @speed == 0  
  end

  def remove_carriage
    @count_carriages -= 1 if @speed == 0 && @count_carriages > 0 
  end

  def add_route(route)
    @route = route
    @station_index = 0
  end

  def move_next
    @station_index += 1 if @route.stations[@station_index + 1]
  end

  def move_previous
    @station_index -= 1 if @station_index > 0
  end

  def current_station
    @route.stations[@station_index]
  end

  def next_station
    @route.stations[@station_index + 1]
  end

  def previous_station
    @route.stations[@station_index - 1] if @station_index > 0
  end
end