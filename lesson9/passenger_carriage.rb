class PassengerCarriage < Carriage
  attr_reader :free_seats

  def initialize(seats)
    @seats = seats.to_i
    validate!
    @free_seats = @seats
  end

  def take_seat
    raise 'All seats  are occupied' if @free_seats.zero?
    @free_seats -= 1
  end

  def occupied_seats
    @seats - @free_seats
  end

  def puts_info
    "Type: #{self.class} Free seats:\
     #{free_seats} Occupied seats: #{occupied_seats}"
  end

  protected

  def validate!
    raise 'The number of seats can not be nil' if @seats.nil?
    raise 'Number of seats, must be greater than 0' if @seats < 1
    true
  end
end
