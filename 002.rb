# https://projecteuler.net/problem=2
a, b, sum = 1, -1, 0
while a <= 4_000_000
  a, b = a+b, a
  sum += a if a.even?
end
sum # => 4613732
