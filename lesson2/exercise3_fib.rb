fib = [1, 1]

while (fib_value = fib[-1] + fib[-2]) < 100
  fib << fib_value
end

puts fib