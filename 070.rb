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

10_000_000.step by: -1 do |n|
  break n if permutation? n, totient(n)
end
# => 9983167
