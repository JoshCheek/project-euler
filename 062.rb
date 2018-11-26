# https://projecteuler.net/problem=62
cubes = Hash.new { |h, k| h[k] = [] }
best = 1.step do |i|
  p i if i % 10_000 == 0
  digits = (i*i*i).digits.sort
  cubes[digits] << i
  break cubes[digits] if cubes[digits].size >= 5
end
best.map { |i| i*i*i }.min # => 127035954683
