class PassengerTrain < Train

  validate :number, :presence
  validate :number, :format, VALID_NUMBER

  def correct_carriage?(carriage)
    carriage.instance_of?(PassengerCarriage)
  end
end
