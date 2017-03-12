basket = {}
loop do
  print "Введите название товара: "
  name = gets.chomp
  unless basket[name].nil?
    puts "Товар с таким именем уже есть в корзине"
    next  
  end
  break if name.upcase == 'СТОП'

  print "Введите цену за единицу: "
  price = gets.chomp.to_f
  print "Введите количество купленного товара: "
  quantity  = gets.chomp.to_f
  item_basket = { price: price, quantity: quantity, sum: price * quantity }
  basket[name] = item_basket
end

total_amount = 0.0

basket.each_value { |value| total_amount += value[:sum]}

puts basket
puts "Итоговая сумма покупок: #{total_amount}"