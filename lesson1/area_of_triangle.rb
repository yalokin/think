print "Enter height of triangle: "
height = gets.to_f

print "Enter base of triangle: "
base = gets.to_f

if base > 0 && height > 0
  area = 0.5 * height * base
  puts "Area of a triangle is: #{area}"
elsif base <= 0 || height <= 0
  puts "Height and base must be only greater than 0"
end

			

