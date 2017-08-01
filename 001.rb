# https://projecteuler.net/problem=1

1.upto(999).select { |n| n % 3 == 0 || n % 5 == 0 }.reduce(:+)
# => 233168
