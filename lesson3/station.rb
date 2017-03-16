class Station
  attr_reader :name
    
  def initialize(name)
    @name = name
    @trains = []
  end

  def arrive_train(train)
    @trains << train
  end

  def trains
    puts "Поезда, находящиеся на стании #{@name}"
    @trains.each do |train|
      if train.speed == 0
        puts "Поезд №#{train.number} тип: #{train.type} вагонов: #{train.count_carriages}"
      end
    end
  end
  
  def trains_by_type(type)
     @trains.select { |train| train.type == type }
  end

  def depart_train(train)
    @trains.delete(train)  
  end
end