print "Введите число месяца: "
day = gets.chomp.to_i
print "Введите номер месяца: "
month = gets.chomp.to_i
print "Введите год: "
year = gets.to_i

months = [31, 28, 31, 30, 31 ,30, 31, 31, 30, 31 ,30, 31]

if (year % 4 == 0 && year % 100 > 0 ) || year % 400 == 0
  months[1] = 29
end

if month < 1 || month > 12 || day < 1 || day > months[month-1]
  puts "Неверная дата!"
  exit
end

date_number = 0

if month > 1
  (0..month - 2).each { |i| date_number += months[i] }
end

  date_number += day

puts "Порядковый номер даты #{day}.#{month}.#{year} равен: #{date_number}"
