require_relative 'route'
require_relative 'station'
require_relative 'train'

belgorod = Station.new('Belgorod')
moscow = Station.new('Moscow')
kursk = Station.new('Kursk')
orel = Station.new('Orel')

train1 = Train.new(3100, 'passenger', 15)
train2 = Train.new(3110, 'cargo', 30)
train21 = Train.new(3112, 'cargo', 30)
train3 = Train.new(7700, 'passenger', 18)
train4 = Train.new(7710, 'cargo', 40)
train5 = Train.new(4600, 'passenger', 16)
train7 = Train.new(4610, 'cargo', 25)

belgorod.arrive_train(train1)
belgorod.arrive_train(train2)
belgorod.arrive_train(train21)

bel_msk = Route.new(belgorod, moscow)
bel_msk.add_station(kursk)
bel_msk.add_station(orel)

train1.add_route(bel_msk)

#p train1.route.stations[0]
train1.move_next
p train1.next

#p belgorod.trains_by_type('cargo')
=begin

belgorod.arrive_train(train3)
belgorod.arrive_train(train4)
#belgorod.trains

belgorod.depart_train(train4)
train3.go(60)
#belgorod.trains

bel_msk = Route.new(belgorod, moscow)
bel_msk.add_station(kursk)
bel_msk.add_station(orel)
#bel_msk.stations
bel_msk.remove_station(orel)
#bel_msk.stations

train3.stop
#puts train3.speed
#puts train3.carriage
train3.add_carriage
train3.add_carriage
train3.remove_carriage
#puts train3.carriage

train3.route = bel_msk

#p train3.route.stations


=end