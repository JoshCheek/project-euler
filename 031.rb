# https://projecteuler.net/problem=31

COINS = [1, 2, 5, 10, 20, 50, 100, 200]
MEMO  = {}

def num_ways(target, max)
  MEMO[[target, max]] ||= count_ways target, max
end

def count_ways(target, max)
  return 0 if target.zero?
  COINS.sum do |n|
    if target < n || max < n
      0
    elsif n == target
      1
    else
      count_ways target-n, n
    end
  end
end

num_ways(200, COINS.max) # => 73682
