# https://projecteuler.net/problem=55

def revadd(n)
  n + n.to_s.reverse.to_i
end
revadd 47 # => 121

def palindrome?(n)
  digits = n.digits
  digits == digits.reverse
end
palindrome? 47  # => false
palindrome? 121 # => true

def lychel?(n, cache, tries_left=50)
  return cache[n] unless cache[n].nil?
  n_next = revadd(n)
  return cache[n] = false if palindrome?(n_next)
  return cache[n] = true  if tries_left.zero?
  cache[n] = lychel? n_next, cache, tries_left-1
end

# sanity check
cache = {}
lychel? 47, cache  # => false
lychel? 349, cache # => false
cache # => {47=>false, 4213=>false, 1292=>false, 349=>false}
lychel? 196, cache # => true

# calculate it
(1...10_000).count { |n| lychel? n, cache } # => 249
