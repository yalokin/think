basket = {}
total_amount = 0.0

loop do
  print "Введите название товара: "
  name = gets.chomp
  if basket[name]
    puts "Товар с таким именем уже есть в корзине!"
    next  
  end
  break if name.upcase == 'СТОП'

  print "Введите цену за единицу: "
  price = gets.chomp.to_f
  print "Введите количество купленного товара: "
  quantity  = gets.chomp.to_f
  item_basket = { price: price, quantity: quantity, sum: price * quantity }
  basket[name] = item_basket
  total_amount += item_basket[:sum]
end

puts basket
puts "Итоговая сумма покупок: #{total_amount}"