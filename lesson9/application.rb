class Application

  MENU = { 1 => ['make_station', 'To create a station'],
           2 => ['make_train', 'To create a train'],
           3 => ['make_route', 'To create route'],
           4 => ['assign_route', 'To assign a route to the train'],
           5 => ['add_carriage', 'To add а carriage to the train'],
           6 => ['remove_carriage', 'To remove а carriage from the train'],
           7 => ['move_train_next', 'Move train to the next station'],
           8 => ['move_train_previous', 'Move train to the previous station'],
           9 => ['print_stations', 'See all stations'],
           10 => ['print_station_trains', 'See trains on the station'],
           11 => ['train_info', 'See information about train'],
           0 => %w(exit Exit) }.freeze

  def menu
    puts 'Enter your number of action'
    MENU.each { |key, value| puts "#{key} - #{value[1]}" }
    choise = gets.chomp.to_i
    choise if MENU[choise]
  end

  def action(choise)
    unless choise
      puts 'Choose the correct option'
      return
    end
    method = MENU[choise][0]
    send(method)
  end

  private

  def make_station
    print 'Enter name of the station: '
    name = gets.strip
    if Station.exist?(name)
      puts "Station #{name} already exists"
    else
      Station.new(name)
      puts "Station #{name} was added"
    end
  rescue RuntimeError => e
    puts e.message
  end

  def make_train
    print 'Enter number of train: '
    number = gets.strip
    if Train.find(number)
      print "Train #{number} already exists"
      return
    end
    print 'Enter type of train, 1 - passenger, 2 - cargo: '
    type = gets.chomp.to_i
    if type == 1
      PassengerTrain.new(number)
      puts "Train #{number} was added"
    elsif type == 2
      CargoTrain.new(number)
      puts "Train #{number} was added"
    end
  rescue RuntimeError => e
    puts e.message
  end

  def make_route
    print 'Enter first station: '
    first_station = gets.strip
    print 'Enter last station: '
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
      puts 'The selected route does not exist'
      return
    end
  end

  def add_carriage
    n_train = choose_train
    return unless n_train
    carriage = make_carriage
    Train.find(n_train).add_carriage(carriage) if carriage
  end

  def make_carriage
    puts 'Enter 1 if add passenger carriage or'
    puts '2 if add cargo carriage'
    type = gets.chomp.to_i
    if type == 1
      puts 'Enter number of seats'
      PassengerCarriage.new(gets.chomp)
    elsif type == 2
      puts 'Enter volume of carriage'
      CargoCarriage.new(gets.chomp)
    else
      puts '1 or 2!'
      return
    end
  rescue RuntimeError => e
    puts e.message
  end

  def remove_carriage
    n_train = choose_train
    Train.find(n_train).remove_carriage
    puts 'Carriage was deleted'
  end

  def move_train_next
    n_train = choose_train
    Train.find(n_train).move_next
  end

  def move_train_previous
    n_train = choose_train
    Train.find(n_train).move_previous
  end

  def print_stations
    Station.all.each_value do |station_obj|
      puts station_obj.name
    end
  end

  def print_station_trains
    puts 'Choose station from list'
    print_stations
    station = Station.find(gets.strip)
    if station
      station.each_train do |train|
        puts "Number: #{train.number} Type: #{train.class} Carriages: #{train.carriages.size}"
      end
    else
      puts 'Station does not exists'
    end
  end

  def print_routes
    Route.all.each_value { |route| puts "Route - #{route.name}" }
  end

  def print_trains
    Train.all.each_value { |train| puts train.number }
  end

  def train_info
    puts 'Choise station'
    print_stations
    station = Station.find(gets.strip)
    puts 'Choice number of train'
    print_trains
    train_number = gets.strip
    if station.train_exists?(train_number)
      train = Train.find(train_number)
      train.each_carriage { |carriage, number| puts "No: #{number} #{carriage.info}" }
    end
  rescue RuntimeError => e
    puts e.message
  end

  def choose_train
    puts 'Choice train number'
    print_trains
    n_train = gets.strip
    if Train.find(n_train)
      n_train
    else
      puts 'The selected train does not exist'
      return
    end
  end
end
