# https://projecteuler.net/problem=27
require 'prime'

def len(a, b)
  n = 0
  n += 1 while (n*n + a*n + b).prime?
  n
end

max, max_a, max_b = 0, 0, 0
-1000.upto(1000) do |a|
  -1000.upto(1000) do |b|
    crnt_len = len a, b
    next unless max < crnt_len
    max, max_a, max_b = crnt_len, a, b
    max   # => 1,     2,    3,    4,    5,    6,    7,    8,    9,    11,   71
    max_a # => -1000, -996, -499, -325, -245, -197, -163, -131, -121, -105, -61
    max_b # => 2,     997,  997,  977,  977,  983,  983,  941,  947,  967,  971
  end
end

max_a * max_b # => -59231
