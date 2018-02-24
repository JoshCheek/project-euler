# https://projecteuler.net/problem=28

# 43 44 45 46 47 48 49
# 42 21 22 23 24 25 26
# 41 20  7  8  9 10 27
# 40 19  6  1  2 11 28
# 39 18  5  4  3 12 29
# 38 17 16 15 14 13 30
# 37 36 35 34 33 32 31

max_side_len = 1001
# max_side_len = 5

sides = 0.upto(max_side_len/2).map { |i| 2*i+1 }

1 + sides.each_cons(2).sum { |s_pre, s_crnt|
  down_right = s_pre**2 + 1*s_crnt - 1
  down_left  = s_pre**2 + 2*s_crnt - 2
  up_left    = s_pre**2 + 3*s_crnt - 3
  up_right   = s_pre**2 + 4*s_crnt - 4
  down_right + down_left + up_left + up_right
}
# => 669171001
