print "Введите число месяца: "
day = gets.chomp.to_i
print "Введите номер месяца: "
month = gets.chomp.to_i
print "Введите год: "
year = gets.to_i

months = {
  1  => 31,
  2  => 28,
  3  => 31,
  4  => 30,
  5  => 31,
  6  => 30,
  7  => 31,
  8  => 31,
  9  => 30,
  10 => 31,
  11 => 30,
  12 => 31
}

if (year % 4 == 0 && year % 100 > 0 ) || year % 400 == 0
  months[2] = 29
end

if month < 1 || month > 12 || day < 1 || day > months[month]
  puts "Неверная дата!"
  exit
end

date_number = 0

if month > 1
  for i in 1..month-1
    date_number += months[i]
  end
  date_number += day
else
  date_number += day
end

puts "Порядковый номер даты #{day}.#{month}.#{year} равен: #{date_number}"
