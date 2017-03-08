print "Enter coefficient a: "
a = gets.to_f
print "Enter coefficient b: "
b = gets.to_f
print "Enter coefficient c: "
c = gets.to_f

if a == 0
	puts "На ноль делить нельзя!"
	exit
end

d = b**2 - 4.0 * a * c

if d < 0
	puts "Корней нет!"
elsif d == 0
	x = -b / (2.0 * a)
	puts "Дискриминант D = #{d}"
	puts "Корень x = #{x}"
else
	x_1 = (-b + Math.sqrt(d)) / (2 * a)
	x_2 = (-b - Math.sqrt(d)) / (2 * a)
	puts "Корни уравнения x1 = #{x_1} и x2 = #{x_2}"
	puts "Дискриминант D = #{d}"
end
	