class CargoCarriage < Carriage
  attr_reader :free_volume

  def initialize(volume)
    @volume = volume.to_f
    validate!
    @free_volume = @volume
  end

  def load(volume)
    raise "There is not enough volume to load" if @free_volume - volume < 0 
    @free_volume -= volume
  end

  def occupied_volume
    @volume - @free_volume
  end

  def info
    "Type: #{self.class} Free volume: #{free_volume} Occupied seats: #{occupied_volume}"
  end

  protected

  def validate!
    raise "The volume of carriage can not be nil" if @volume.nil?
    raise "Volume of carriage, must be greater than 0" if @volume.zero? 
    true
  end
 
end