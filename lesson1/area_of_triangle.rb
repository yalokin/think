print "Enter height of triangle: "
triangle_height = gets.to_f

print "Enter base of triangle: "
triangle_base = gets.to_f

if triangle_base > 0 && triangle_height > 0
	area_of_triangle = 1.0 / 2.0 * triangle_height * triangle_base
	puts "Area of a triangle is: #{area_of_triangle}"
elsif triangle_base <= 0 || triangle_height <= 0
	puts "Height and base must be only greater than 0"
end

			

