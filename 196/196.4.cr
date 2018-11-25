# https://projecteuler.net/problem=196
require "./tmp"

def sum_for_row(n, primes)
  counts_for_row(n, primes)
    .zip(row(n).to_a)
    .select { |count, n| count > 2 }
    .map { |count, n| n }
    .sum
end

def row(i)
  start = i * (i-1) / 2 + 1
  stop  = i * (i+1) / 2
  start..stop
end

def counts_for_row(n, primes)
  # above
  counts_above = row(n-2).map { |i| primes.include?(i) ? 1 : 0 }
  counts_above.unshift 0
  counts_above << 0 << 0

  counts_above = counts_above.each_cons(3).map(&.sum).to_a.zip(
    row(n-1).map { |n| primes.include?(n) ? 1 : 0 }.to_a
  ).map { |prev_count, n| n == 0 ? 0 : n + prev_count }
  counts_above.unshift 0
  counts_above << 0 << 0

  # below
  counts_below = row(n+2).map { |i| primes.include?(i) ? 1 : 0 }
  counts_below.unshift 0

  counts_below = counts_below.each_cons(3).map(&.sum).to_a.zip(
    row(n+1).map { |n| primes.include?(n) ? 1 : 0 }.to_a
  ).map { |prev_count, n| n == 0 ? 0 : n + prev_count }
  counts_below.unshift 0

  # crnt
  row(n)
    .map { |n| primes.include?(n) ? 1 : 0 }.to_a
    .zip(counts_above.each_cons(3).map(&.sum).to_a)
    .map { |n, above| n == 0 ? 0 : n + above }.to_a
    .zip(counts_below.each_cons(3).map(&.sum).to_a)
    .map { |n, below| n == 0 ? 0 : n + below }.to_a
end

def time
  start = Time.now
  yield
  Time.now - start
end

primes = Primes.new 5_097_382_u64

p sum_for_row(8_u64, primes)       # => 60_u64
p sum_for_row(9_u64, primes)       # => 37_u64
p sum_for_row(10000_u64, primes)   # => 950007619_u64
p sum_for_row(5678027_u64, primes) # => 63480541604260474_u64
p sum_for_row(7208785_u64, primes) # => 201630334826257720_u64
