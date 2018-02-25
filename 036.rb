# https://projecteuler.net/problem=36
def palindromic?(n)
  return false unless n.digits == n.digits.reverse
  bin_digits = n.to_s(2).chars
  bin_digits == bin_digits.reverse
end

1.upto(1_000_000)
 .select { |n| palindromic? n } # => [1, 3, 5, 7, 9, 33, 99, 313, 585, 717, 7447, 9009, 15351, 32223, 39993, 53235, 53835, 73737, 585585]
 .sum                           # => 872187
