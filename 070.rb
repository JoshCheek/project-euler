# https://projecteuler.net/problem=70
require 'prime'

def totient(number)
  prime_division = number.prime_division
  n = prime_division.map { |n, pow| n ** pow }.reduce(:*)
  m = prime_division.map { |n, pow| 1 - 1r/n }.reduce(:*)
  (n*m).numerator
end

def permutation?(a, b)
  a.digits.sort == b.digits.sort
end

best_totient = 0
best_number  = Float::INFINITY
best_ratio   = Float::INFINITY
10_000_000.downto(2) do |n|
  p n if n % 500_000 == 0
  # break if n < best_totient
  t = totient n
  next unless permutation? n, t
  r = n.to_r / t
  next unless r < best_ratio
  best_ratio   = r
  best_number  = n
  best_totient = t
end

# {:best_number=>8319823, :best_totient=>8313928, :best_ratio=>1.0007090511248113}
p best_number: best_number, best_totient: best_totient, best_ratio: best_ratio.to_f
