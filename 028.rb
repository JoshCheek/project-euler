# https://projecteuler.net/problem=28


max_side_len = 1001
# max_side_len = 5

1 + (0...max_side_len/2).sum { |i|
  16*i*i + 36*i + 24
}
# => 669171001
