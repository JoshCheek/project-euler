# https://projecteuler.net/problem=23

max = 28123
# max = 30
max += 1

divisor_sums = Array.new max, 0
1.upto max/2 do |base|
  crnt = base
  loop do
    crnt += base
    break if divisor_sums.length <= crnt
    divisor_sums[crnt] += base
  end
end

abundants = max.times.select { |n| n < divisor_sums[n] }

summable = Array.new max, false
abundants.each do |a1|
  abundants.each do |a2|
    sum = a1 + a2
    break if summable.length <= sum
    summable[sum] = true
  end
end

max.times.reject { |i| summable[i] }.sum # => 4179871
