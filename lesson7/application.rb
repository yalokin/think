class Application
  #только на время отладки, затем убрать
  attr_reader :stations, :trains, :routes

  def initialize
    @stations = {}
    @trains = {}
    @routes = []
  end

  def print_menu
    puts "Enter your number of action"
    puts "1 - To create a station"
    puts "2 - To create a train"
    puts "3 - To create route"
    puts "4 - To assign a route to the train"
    puts "5 - To add а carriage to the train"
    puts "6 - To remove а carriage from the train"
    puts "7 - Move train to the next station"
    puts "8 - Move train to the previous station"
    puts "9 - See all stations"
    puts "10 - See trains on the station"
    puts "11 - See information about train"
    puts "0 - Exit"
    select = gets.chomp.to_i
    exit if select == 0 
    return select
  end

  def action_menu(select)
    case select
    when 1
      make_station
    when 2
      make_train
    when 3
      make_route
    when 4
      assign_route
    when 5
      add_carriage
    when 6
      remove_carriage
    when 7
      move_train_next
    when 8
      move_train_previous
    when 9
      print_stations
    when 10
      print_station_trains
    when 11
      train_info
    end
  end

  private
  #потому что используются только внутри методов класса

  def make_station  
    print "Enter name of the station: "
    name = gets.strip

    unless @stations.has_key?(name)
      @stations[name] = Station.new(name.to_s)
      puts "Station #{name} was added"
    else
      puts "Station #{name} already exists"
    end
  rescue RuntimeError => e
    puts e.message  
  end

  def make_train
    print "Enter number of train: "
    number = gets.strip
    if Train.find(number)
      print "Train #{number} already exists"
      return
    end

    print "Enter type of train, 1 - passenger, 2 - cargo: " 
    type = gets.chomp.to_i
    if type == 1
      @trains[number] = PassengerTrain.new(number)
      puts "Train #{number} was added"
    elsif type == 2
      @trains[number] = CargoTrain.new(number)
      puts "Train #{number} was added"
    end
  rescue RuntimeError => e
    puts e.message  
  end

  def make_route
    print "Enter first station: "
    first_station = gets.strip
    print "Enter last station: "
    last_station = gets.strip

    Route.new(Station.find(first_station), Station.find(last_station))
    puts "Route #{first_station} - #{last_station} was created"

  rescue RuntimeError => e
    puts e.message  
  end

  def assign_route
    n_train = choose_train
    return unless n_train

    puts "Choice route to assign to train #{n_train}"
    print_routes
    route = Route.find(gets.strip)
    train = Train.find(n_train)
    
    if route
      train.add_route(route)
      route.stations[0].arrive_train(train)
      puts "The route was assigned to the train - #{n_train}"
    else
      puts "The selected route does not exist"
      return
    end
  end

  def add_carriage   
    n_train = choose_train
    return unless n_train

    carriage = make_carriage
    @trains[n_train].add_carriage(carriage) if carriage
  end

  def make_carriage
    puts "Enter 1 if add passenger carriage or"
    puts "2 if add cargo carriage"
    type = gets.chomp.to_i
    if type == 1
      puts "Enter number of seats"
      @carriage = PassengerCarriage.new(gets.chomp)
    elsif type == 2
      puts "Enter volume of carriage"   
      @carriage = CargoCarriage.new(gets.chomp)
    else
      puts "1 or 2!"
      return   
    end
  rescue RuntimeError => e
    puts e.message 
  end

  def remove_carriage
    n_train = choose_train
    @trains[n_train].remove_carriage
    puts "Carriage was deleted"
  end

  def move_train_next
    n_train = choose_train
    @trains[n_train].move_next    
  end

  def move_train_previous
    n_train = choose_train
    @trains[n_train].move_previous
  end

  def print_stations
    @stations.each_value do |station_obj|
      puts "#{station_obj.name}"
    end
  end

  def print_station_trains
    puts "Choose station from list"
    print_stations
    station = Station.find(gets.strip)
    if station
      station.each_train { |train| puts "Number: #{train.number} Type: #{train.class} Carriages: #{train.carriages.size}"}
    else
      puts "Station does not exists"
    end
  end

  def print_routes
    Route.all.each_value { |route| puts "Route - #{route.name}" }
  end

  def print_trains
    Train.all.each_value { |train| puts "#{train.number}" }
  end

  def train_info
    puts "Choise station"
    print_stations
    station = Station.find(gets.strip)
    puts "Choice number of train"
    print_trains
    train_number = gets.strip
    if station.train_exists?(train_number)
      train = Train.find(train_number)  
      train.each_carriage { |carriage, number| puts "No: #{number} #{carriage.info}"}
    end
  
  rescue RuntimeError => e
    puts e.message 
  end

  def choose_train
    puts "Choice train number"   
    print_trains
    n_train = gets.strip

    if Train.find(n_train)
      n_train
    else
      puts "The selected train does not exist"
      return 
    end
  end
end