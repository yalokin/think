require_relative 'instance_counter'
require_relative 'manufacturer'
require_relative 'validation'

class Train
  include Manufacturer
  include InstanceCounter
  include Validation

  VALID_NUMBER = /^[a-z0-9]{3}-{0,1}[a-z0-9]{2}$/i

  @@trains = {}

  def self.find(number)
    @@trains[number]
  end

  def self.all
    @@trains
  end

  attr_reader :number, :speed, :carriages

  validate :number, :format, VALID_NUMBER

  def initialize(number)
    @number = number
    validate!
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
    @carriages << carriage if @speed.zero? && correct_carriage?(carriage)
  end

  def remove_carriage
    @carriages.delete_at(-1) if @speed.zero?
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

  def each_carriage
    carriages.each.with_index(1) { |carriage, number| yield(carriage, number) }
  end

  # protected

  # def validate!
  #   raise 'Number has invalid format' if number !~ VALID_NUMBER
  #   true
  # end
end
