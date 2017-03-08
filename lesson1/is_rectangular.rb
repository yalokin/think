print "Enter side a of triangle: "
a = gets.to_f

print "Enter side b of triangle: "
b = gets.to_f

print "Enter side c of triangle: "
c = gets.to_f

# Находим гипотенузу и переопределяем стороны
if a > b && a > c
  hypotenuse, a, b = a, b, c
elsif b > a && b > c
	hypotenuse , b = b, c
elsif c > a && c > b
	hypotenuse = c
else
	puts "The triangle is not rectangular"
end

#  если гипотенуза есть, вычисляем по формуле Пифагора
if hypotenuse && hypotenuse ** 2 == a**2 + b ** 2
	puts "The triangle is rectangular"
elsif hypotenuse
	puts "The triangle is not rectangular"	
end

#равнобедренный ли треугольник
if a == b || a == c || c == b 
	puts "The triangle is isosceles"
end	
