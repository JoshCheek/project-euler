# https://projecteuler.net/problem=57

d = 2 + 1r/2  # => (5/2)

# Wow, found this pattern really quickly!
1 + 1r/2                   # => (3/2)
1 + 1r/d                   # => (7/5)
( 3*d +  1r)/( 2*d +  1r)  # => (17/12)
( 7*d +  3r)/( 5*d +  2r)  # => (41/29)
(17*d +  7r)/(12*d +  5r)  # => (99/70)
(41*d + 17r)/(29*d + 12r)  # => (239/169)
(99*d + 41r)/(70*d + 29r)  # => (577/408)

# now we automate it!
nums = [1+1r/2, 1+1r/d, (3*d+1r)/(2*d+1r)]
until nums.size == 1000
  n1, n2 = nums[-2], nums[-3]
  numerator = d*n1.numerator + n2.numerator
  denominator = d*n1.denominator + n2.denominator
  nums << numerator/denominator
end

nums.count { |num| num.numerator.digits.size > num.denominator.digits.size }
# => 153
