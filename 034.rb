# https://projecteuler.net/problem=34

def factorial(n)
  return 1 if n.zero?
  return n * factorial(n-1)
end

def match?(n)
  n == n.digits.sum { |d| FACTORIAL[d] }
end

FACTORIAL = [*0..9].map { |n| factorial n }

10.upto(factorial(9)*9)    # => #<Enumerator: 10:upto(3265920)>
  .select { |n| match? n } # => [145, 40585]
  .sum                     # => 40730
