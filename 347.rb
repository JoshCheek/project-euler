require 'prime'

bound = 10_000_000
seive = Hash.new { |h, k| h[k] = [] }

Prime.each do |divisor|
  break if divisor > bound
  divisor.step by: divisor, to: bound do |num|
    seive[num] << divisor
  end
end

matches = {}
seive.each do |index, divisors|
  matches[divisors] = index if divisors.size == 2
end

matches.sum { |divisors, num| num } # => 11109800204052
