# https://projecteuler.net/problem=243

# a shitty impl of euler's totient
def totient(d)
  dr = d.to_r
  1.upto(d).count { |n| (n/dr).denominator == d }
end

# just experimenting to get it figured out
require 'prime'
36.prime_division # => [[2, 2], [3, 2]]

36 * (1 - 1r/2) * (1 - 1r/3) # => (12/1)

90.prime_division  # => [[2, 1], [3, 2], [5, 1]]
840.prime_division # => [[2, 3], [3, 1], [5, 1], [7, 1]]

840 * (1-1r/2) * (1 - 1r/3) * (1 - 1r/5) * (1 - 1r/7) # => (192/1)
1.upto(100).map { |d| [d, totient(d)] }.map { |(d, n)| [n.to_f / (d-1), d, n] }.sort.take(10)
# => [[0.2696629213483146, 90, 24],
#     [0.2711864406779661, 60, 16],
#     [0.27586206896551724, 30, 8],
#     [0.2891566265060241, 84, 24],
#     [0.2926829268292683, 42, 12],
#     [0.3076923076923077, 66, 20],
#     [0.3116883116883117, 78, 24],
#     [0.3368421052631579, 96, 32],
#     [0.3380281690140845, 72, 24],
#     [0.33962264150943394, 54, 18]]

# k.... can we calculate the ratio?
def R(d)
  totient(d).to_f / (d-1)
end
4.0 / 11 # => 0.36363636363636365
R 12     # => 0.36363636363636365

# seems that more prime divisors with lower powers is better
R 2            # => 1.0
R 2*3*5*7      # => 0.22966507177033493
R 2*3*5        # => 0.27586206896551724
R 2**2 * 3**2  # => 0.34285714285714286
R 2*3          # => 0.4
R 2**4         # => 0.5333333333333333
R 2**3         # => 0.5714285714285714
R 2**2         # => 0.6666666666666666

# Soooooooo.....
def totient(n, primes)
  n * primes.map { |p| 1 - 1r/p }.reduce(1, :*)
end
def R(primes)
  d = primes.reduce(:*)
  t = totient(d, primes)
  [t.to_f / (d-1), t.numerator, d]
end

# target
target = 15499r/94744 # => (15499/94744)
target.to_f           # => 0.1635881955585578

# looks like the first 9 primes does it
require 'prime'
R Prime.take(1)  # => [1.0, 1, 2]
R Prime.take(2)  # => [0.4, 2, 6]
R Prime.take(3)  # => [0.27586206896551724, 8, 30]
R Prime.take(4)  # => [0.22966507177033493, 48, 210]
R Prime.take(5)  # => [0.2078822000866176, 480, 2310]
R Prime.take(6)  # => [0.19181457924006792, 5760, 30030]
R Prime.take(7)  # => [0.18052571061430847, 92160, 510510]
R Prime.take(8)  # => [0.1710240400491191, 1658880, 9699690]
R Prime.take(9)  # => [0.16358819608886738, 36495360, 223092870]
R Prime.take(10) # => [0.15794722312636564, 1021870080, 6469693230]

# okay... tried entering the value for 9 and 10, but that's not it >.<
1.upto(20).find do |d|
  _, n, d = R Prime.take(d)
  (n*94744) < (15499*(d-1))
end
# => 10


# sigh, try again... just lots of experimenting, really
def totient(prime_division)
  n = prime_division.map { |n, pow| n ** pow }.reduce(:*)
  m = prime_division.map { |n, pow| 1 - 1r/n }.reduce(:*)
  n*m
end
def R(d)
  tot = totient(d.prime_division)
  r   = tot / (d-1)
  [r, r.to_f, tot.numerator, d]
end

require 'set'
nums = Set[2]
primes = Prime.take 10
10.times do
  nums += nums.flat_map { |n|
    primes.map { |p| p*n }
  }
end
nums.length # => 184756

# there it is, finally >.<
nums.map { |n| R(n) }
    .select { |r, f, n, d| r < (target) }
    .sort_by(&:last)
    .first # => [(145981440/892371479), 0.16358819553891188, 145981440, 892371480]
    .last  # => 892371480
