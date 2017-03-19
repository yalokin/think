class Application
  attr_reader :stations, :trains, :routes
  
  def initialize
    @stations = {}
    @trains = {}
    @routes = []
  end

  def make_station
    
    print "Enter name of the station: "
    name = gets.strip
    
    if @stations[name.to_sym].nil? 
      @stations[name.to_sym] = Station.new(name)
      puts "Station #{name} was added"
    else
      puts "Station #{name} already exists"
    end
  end

  def make_train
    
    print "Enter type of train, 1 - passenger, 2 - cargo: " 
    type = gets.chomp.to_i
    
    print "Enter number of train: "
    number = gets.chomp.to_i
    
    if type == 1 && train_not_exist?(number)
      @trains[number] = PassengerTrain.new(number)
      puts "Train #{number} was added"
    elsif type == 2 && train_not_exist?(number)
      @trains[number] = CargoTrain.new(number)
      puts "Train #{number} was added"
    elsif @trains[number]
      puts "Train #{number} already exists"
    end  

  end

  def make_route
    print "Enter first station: "
    first_station = gets.strip
    print "Enter last station: "
    last_station = gets.strip

    if @stations[first_station.to_sym] && @stations[last_station.to_sym]
      @routes << Route.new(@stations[first_station.to_sym], @stations[last_station.to_sym])
    else
      puts "Stations do not exist" 
    end
  end

  def assign_route

    n_train = choose_train

    puts "Choice route to assign to train #{n_train}"
    print_routes
    n_route = gets.chomp.to_i

    @trains[n_train].add_route(@routes[n_route])
    @routes[n_route].stations[0].arrive_train(n_train)
  end

  def add_carriage
    
    n_train = choose_train
    type = @trains[n_train].class.to_s

    if type == 'PassengerTrain'
      @trains[n_train].add_carriage(PassengerCarriage.new)
    elsif type == 'CargoTrain'
      @trains[n_train].add_carriage(CargoCarriage.new)
    end    
    puts "The carriage was added"
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
    @routes.each_with_index do |route, i|
      puts "#{i} - #{route.stations[0].name} #{route.stations[-1].name}" 
    end
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

  def train_not_exist?(number)
    true unless @trains[number]
  end

  def print_trains
    @trains.each_key { |key| puts "#{key}" }
  end

  def choose_train

    puts "Choice train number"   
    print_trains
    n_train = gets.chomp.to_i

  end

end