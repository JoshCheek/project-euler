# https://projecteuler.net/problem=46
require 'prime'
nums    = 1.step
primes  = Prime.each
squares = Enumerator.new do |y|
  1.step { |n| y << n*n }
end


seen = [true]
primes_seen = [primes.next]
squares_seen = [squares.next]
primes_seen.each { |p| squares_seen.each { |s| seen[p+2*s] = true } }

loop do
  crnt = nums.next
  while primes_seen.last < crnt
    p = primes.next
    primes_seen << p
    squares_seen.each { |s| seen[p+2*s] = true }
  end
  while squares_seen.last < crnt
    s = squares.next
    squares_seen << s
    primes_seen.each { |p| seen[p+2*s] = true }
  end
  next if seen[crnt]
  next if crnt.even?
  next if crnt.prime?
  next if crnt == 1
  break crnt
end
# => 5777
