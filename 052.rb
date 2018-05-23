# https://projecteuler.net/problem=52

1.upto Float::INFINITY do |n|
  digits = n.digits.sort
  next unless (6*n).digits.sort == digits
  next unless (5*n).digits.sort == digits
  next unless (4*n).digits.sort == digits
  next unless (3*n).digits.sort == digits
  next unless (2*n).digits.sort == digits
  break n
end
# => 142857
