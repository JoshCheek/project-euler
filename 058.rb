# https://projecteuler.net/problem=58

sides = Enumerator.new do |y|
  n = 1
  y << [1, 1]
  2.step by: 2 do |side|
    y << [
      side+1,
      n += side,
      n += side,
      n += side,
      n += side,
    ]
  end
end

require 'prime'
primes = total = 0r
sides.each do |side, *vals|
  total  += vals.size
  primes += vals.count { |v| v.prime? }
  break side if primes/total < 1r/10 && 1 < total
end # => 26241
