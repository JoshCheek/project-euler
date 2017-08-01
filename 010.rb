# https://projecteuler.net/problem=10
require 'prime'
Prime.take_while { |n| n < 2_000_000 }.reduce(0, :+)
# => 142913828922
