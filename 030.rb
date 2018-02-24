# https://projecteuler.net/problem=30

def digit_sum(n, power)
  n.digits.sum { |d| d ** power }
end

def max_for(power)
  max = 0
  max = max*10 + 9 while max <= digit_sum(max, power)
  max
end

def nums_that_can_be_written_as_powers_of(p)
  10.upto(max_for p).select { |n| n == digit_sum(n, p) }
end

def f(power)
  nums_that_can_be_written_as_powers_of(power).sum
end

f 4 # => 19316
f 5 # => 443839
