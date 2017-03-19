require_relative 'train'
require_relative 'cargo_train'
require_relative 'passenger_train'
require_relative 'station'
require_relative 'route'
require_relative 'carriage'
require_relative 'cargo_carriage'
require_relative 'passenger_carriage'
require_relative 'application.rb'

app = Application.new

loop do
  app.action_menu(app.print_menu)
  puts
  p app.stations
  p app.trains
  p app.routes
end