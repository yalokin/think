class Train
    attr_reader :number, :speed, :count_carriages

  def initialize(number)
    @number = number
    @type = self.class
    @speed = 0
    @carriages = []
  end

  def speed_up(speed)
    @speed += speed
  end

  def stop
    @speed = 0
  end

  def add_carriage(carriage)
    @carriages << carriage if @speed == 0  
  end

  def remove_carriage(carriage)
    @carriages.delete(carriage) if @speed == 0 
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
  # пока что не вижу какие методы можно определить в секции private и protected
end