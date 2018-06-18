# https://projecteuler.net/problem=58
require 'prime'

num    = 1
primes = 0.0
total  = 1

2.step by: 2 do |side|
  total += 4
  4.times do
    num += side
    primes += 1 if num.prime?
  end
  break side+1 if primes/total < 0.10
end # => 26241
