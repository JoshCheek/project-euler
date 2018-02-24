# https://projecteuler.net/problem=21

def divisor_sum(n)
  1.upto(n/2).select { |d| n % d == 0 }.sum
end


sums  = 0.upto(10_000).map { |n| divisor_sum n }
pairs = sums.select.with_index { |d, i| d != i && i == sums[d] }
pairs     # => [284, 220, 1210, 1184, 2924, 2620, 5564, 5020, 6368, 6232]
pairs.sum # => 31626
