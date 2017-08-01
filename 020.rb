# https://projecteuler.net/problem=20

1.upto(100).reduce(1, :*).to_s.chars.map(&:to_i).reduce(0, :+) # => 648
