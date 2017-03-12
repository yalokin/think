fib = []
fib[0] = 1
fib[1] = 1

i = 2
loop do
  fib_value = fib[i-2] + fib[i-1]
  break if fib_value >= 100
  fib << fib_value
  i += 1
end

puts fib