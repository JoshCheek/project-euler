# https://projecteuler.net/problem=6

nums = 1..100

sum_of_squares = nums.map { |n| n**2 }.reduce(0, :+)
square_of_sums = nums.reduce(0, :+) ** 2

square_of_sums - sum_of_squares # => 25164150
