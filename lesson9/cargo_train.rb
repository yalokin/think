class CargoTrain < Train

  validate :number, :presence
  validate :number, :format, VALID_NUMBER

  def correct_carriage?(carriage)
    carriage.instance_of?(CargoCarriage)
  end
end
