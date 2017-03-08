print "What is your name? "
name = gets.chomp

print "what is your height? "
height = gets.to_i

ideal_weight = height - 110

if ideal_weight > 0
  puts "#{name}, your ideal weight is: #{ideal_weight}"
else
  puts "#{name}, your weight is already optimal."
end	

