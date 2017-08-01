# https://projecteuler.net/problem=5
require 'prime'
[*1..20]
  .flat_map { |n| n.prime_division }
  .group_by(&:first)
  .map { |k, vs| [k, vs.map(&:last).max] }
  .map { |base, exponent| base ** exponent }
  .reduce(1, :*)
  # => 232792560
