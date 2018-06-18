# https://projecteuler.net/problem=92
cache     = {}
cache[1]  = false
cache[89] = true

succ = lambda { |n| n.digits.sum { |d| d*d } }

add_to_cache = lambda do |n|
  cache.fetch(n) do
    cache[n] = add_to_cache[succ[n]]
  end
end

is_square = lambda do |n|
  n < 500 ? cache[n] : is_square[succ[n]]
end

1.upto 500, &add_to_cache
(1...10_000_000).count &is_square # => 8581146
