class CargoTrain < Train
    def add_carriage
    @carriages << CargoCarriage.new if @speed == 0  
  end
end