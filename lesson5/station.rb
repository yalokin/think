class Station
  @@stations = {}

  def self.all
    @@stations
  end
  attr_reader :name, :trains
    
  def initialize(name)
    @name = name
    @trains = []
    @@stations[name] = self
  end

  def arrive_train(train)
    @trains << train
  end
  
  def trains_by_type(type)
     @trains.select { |train| train.type == type }
  end

  def depart_train(train)
    @trains.delete(train)  
  end
end