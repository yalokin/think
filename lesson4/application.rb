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
    puts "11 - Exit"
    select = gets.chomp.to_i
    exit if select == 11 
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
    end
  end

  private
  #потому что используются только внутри методов класса

  def make_station  
    print "Enter name of the station: "
    name = gets.strip.to_sym

    unless @stations.has_key?(name)
      @stations[name] = Station.new(name.to_s)
      puts "Station #{name} was added"
    else
      puts "Station #{name} already exists"
    end
  end

  def make_train
    print "Enter number of train: "
    number = gets.chomp.to_i
    if train_exists?(number)
      print 'Train #{number} already exists'
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
  end

  def make_route
    print "Enter first station: "
    first_station = gets.strip.to_sym
    print "Enter last station: "
    last_station = gets.strip.to_sym

    if @stations.has_key?(first_station) && @stations.has_key?(last_station)
      @routes << Route.new(@stations[first_station], @stations[last_station])
      puts "Route #{first_station} - #{last_station} was created"
    else
      puts "Stations do not exist"
      return 
    end
  end

  def assign_route
    n_train = choose_train
    unless n_train
     return
    end

    puts "Choice route to assign to train #{n_train}"
    print_routes
    n_route = gets.chomp.to_i

    if @routes[n_route]
      @trains[n_train].add_route(@routes[n_route])
      @routes[n_route].stations[0].arrive_train(n_train)
      puts "The route was assigned to the train - #{n_train}"
    else
      puts "The selected route does not exist"
      return
    end
  end

  def add_carriage   
    n_train = choose_train
    @trains[n_train].add_carriage
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
    station = gets.strip
    p @stations[station.to_sym].trains
  end

  def print_routes
    @routes.each.with_index(1) do |route, i|
      puts "#{i} - #{route.stations[0].name} #{route.stations[-1].name}" 
    end
  end

  def train_exists?(number)
    @trains.has_key?(number)
  end

  def print_trains
    @trains.each_key { |key| puts "#{key}" }
  end

  def choose_train
    puts "Choice train number"   
    print_trains
    n_train = gets.chomp.to_i

    if @trains.has_key?(n_train)
      return n_train
    else
      puts "The selected train does not exist"
      return 
    end
  end
end