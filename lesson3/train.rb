class Train
  attr_reader :number, :speed, :count_carriages

  def initialize(number, type, count_carriages)
    @number = number
    @type = type
    @count_carriages = count_carriages
    @speed = 0
  end

  def go(speed)
    @speed = speed
  end

  def stop
    @speed = 0
  end

  def add_carriage
    @count_carriages += 1 if @speed == 0  
  end

  def remove_carriage
    @count_carriages -= 1 if @speed == 0  
  end

  def add_route(route)
    @route = route
    @station = 0
  end

  def move_next
    @station += 1 if @route.stations[@station + 1]
  end

  def move_previous
    @station -= 1 if @station > 0
  end

  def now
    @route.stations[@station]
  end

  def next
    @route.stations[@station + 1]
  end

  def previous
    @route.stations[@station - 1]
  end
end