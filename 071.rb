# https://projecteuler.net/problem=71
partition = 3r / 7 # => (3/7)

1.upto(1_000_000).map { |d|
 n = d*3/7
 n -= 1 while n.to_r/d >= partition
 n.to_r/d
}.max       # => (428570/999997)
 .numerator # => 428570
