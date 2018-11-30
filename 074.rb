# https://projecteuler.net/problem=74
def fact(n)
  1.upto(n).reduce(1, :*)
end

def fact_sum(num)
  num.digits.map { |digit| fact digit }.sum
end

def solve(chain, num)
  return chain[num] if chain[num]
  sum = fact_sum(num)
  if sum == num
    chain[num] = 1
  else
    chain[num] = 0 # to guard against loops
    chain[num] = 1 + solve(chain, sum)
  end
end

chain = {}
(1...1_000_000).count { |n| solve(chain, n) == 60 }  # => 402
