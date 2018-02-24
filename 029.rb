# https://projecteuler.net/problem=29

def f(min, max)
  min.upto(max).flat_map { |a|
    min.upto(max).map { |b| a**b }
  }.uniq.count
end

f 2, 5   # => 15
f 2, 100 # => 9183
