class PassengerTrain < Train
  def add_carriage
    @carriages << PassengerCarriage.new if @speed == 0  
  end
end