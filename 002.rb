# https://projecteuler.net/problem=2
a, b, sum = 1, -1, 0
1.step do |i|
  a, b = a+b, a
  break if a > 4_000_000
  sum += a if a.even?
end
sum # => 4613732
