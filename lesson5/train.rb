require_relative 'instance_counter'
require_relative 'manufacturer'
class Train
  include Manufacturer
  include InstanceCounter

  @@trains = {}

  def self.find(number)
    @@trains[number]
  end

  attr_reader :number, :speed

  def initialize(number)
    @number = number
    @speed = 0
    @carriages = []
    @@trains[number] = self
    register_instance
  end

  def speed_up(speed)
    @speed += speed
  end

  def stop
    @speed = 0
  end

  def add_carriage(carriage)
    @carriages << carriage if @speed == 0 && correct_carriage?(carriage) 
  end

  def remove_carriage
    @carriages.delete_at(-1) if @speed == 0 
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