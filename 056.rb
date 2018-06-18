# https://projecteuler.net/problem=56
(1...100).map do |a|
  (1...100).map do |b|
    (a**b).digits.sum
  end.max
end.max # => 972
