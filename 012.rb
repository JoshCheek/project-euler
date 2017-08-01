# https://projecteuler.net/problem=12
require 'prime'

class Integer
  def num_divisors
    prime_division.map { |divisor, times| times.succ }.reduce(1, :*)
  end
end

sum = 0
n   = 1
loop do
  sum += n
  break if sum.num_divisors > 500
  n += 1
end
sum # => 76576500
