class PassengerCarriage < Carriage
  attr_reader :free_seats

  def initialize(seats)
    @seats = seats.to_i
    @free_seats = @seats
  end

  def take_seat
    raise "All seats  are occupied" if @free_seats.zero?
    @free_seats -= 1
  end
  
  def occupied_seats 
    @seats - @free_seats
  end

end