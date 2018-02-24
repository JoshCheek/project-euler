# https://projecteuler.net/problem=28

def f(n)
  raise "doesn't make sense to have an even sided spiral!" if n.even?
  n /= 2
  (16*n*n*n + 30*n*n + 26*n + 3) / 3
end

f 5    # => 101
f 1001 # => 669171001
