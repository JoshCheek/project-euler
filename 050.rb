# https://projecteuler.net/problem=50
require 'prime'  # => true

primes = Prime.take_while { |p| p < 1_000_000 }
best_run = [2]

primes.each_index do |start|
  for stop in start+best_run.length...primes.length
    run = primes[start..stop]
    sum = run.sum
    break if sum > 1_000_000
    best_run = run if sum.prime?
  end
end
primes.length   # => 78498
best_run.length # => 543
best_run.sum    # => 997651
