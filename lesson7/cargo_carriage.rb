class CargoCarriage < Carriage
  attr_reader :free_volume

  def initialize(volume)
    @volume = volume.to_f
    @free_volume = @volume
  end

  def load(volume)
    raise "There is not enough volume to load" if @free_volume - volume < 0 
    @free_volume -= volume
  end

  def occupied_volume
    @volume - @free_volume
  end
 
end