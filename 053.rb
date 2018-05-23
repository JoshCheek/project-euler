# https://projecteuler.net/problem=53

def fact(n)
  1.upto(n).reduce(1, :*)
end

def choose(n, r)
  fact(n) / fact(r) / fact(n-r)
end

0.upto(100).sum { |n|
  0.upto(n).count { |r| choose(n, r) > 1_000_000 }
} # => 4075
