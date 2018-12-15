require 'prime'


# I observed that
# * fact(i-1)%i was always i-1
# * fact(i-2)%i was always 1
# * fact(i-3)%i was always (i-1)/2
# But I don't understand why :( and then I looked up that I can do this inverse
# calculation, but again, I don't understand why (it's method 3 from here):
# https://www.geeksforgeeks.org/multiplicative-inverse-under-modulo-m/
# The site is really good in that it includes code, but doesn't actually explain
# anything.

def inverse(a, m)
  power a, m-2, m
end

def power(x, y, m)
  return 1 if y.zero?
  p = power(x, y/2, m) % m
  p = (p * p) % m
  return y.even? ? p : x*p % m
end

Prime.lazy.drop(2).take_while { |p| p < 10**8 }.sum do |i|
  t1 = inverse(i-4, i)
  t2 = 2 * inverse(i-1, i) * inverse(i-2, i) * inverse(i-3, i)
  t3 = i * t2
  (i- 1 + t3 - t2 + t1*t3 - t2*t1) / 2 % i
end
# => 139602943319822
