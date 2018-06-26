# https://projecteuler.net/problem=169

# brute force the solution for small values so we can check our results
def num_ways(n)
  max_power    = Math.log(n) / Math.log(2)
  all_divisors = max_power.to_i.downto(0).map { |i| 2**i }
  appearances  = all_divisors.map { |p| [[], [p], [p, p]] }
  potentials   = appearances.reduce do |lefts, rights|
    lefts.flat_map do |left|
      rights.map { |right| [*left, *right] }
    end
  end
  potentials.select { |nums| nums.sum == n }.sort.reverse
end

def num_ways2(n)
  max_power   = Math.log(n) / Math.log(2)
  powers      = max_power.to_i.downto(0).to_a
  divisors    = powers.each_with_object [] do |power, result|
    value = 2**power
    next unless value <= n
    n -= value
    result << [power+1, value]
  end.reverse
  divisors
  cache = {}
  cache[divisors[0][1]] = [divisors[0][0], divisors[0][0]-1]

  divisors.each_cons 2 do |(ln, lv), (hn, hv)|
    ways_to_sum = (hn-ln)*cache[lv][0] + cache[lv][1]
    cache[hv] = [
      ways_to_sum,
      ways_to_sum - cache[lv][0],
    ]
  end
  cache[divisors[-1][1]][0]
end

num_ways2 10**25 # => 178653872807

1.upto 100 do |i|
  s1 = num_ways(i).size
  s2 = num_ways2(i)
  next if s1 == s2
  s1 # =>
  s2 # =>
  raise
end
n = 4+8+32 # => 44
ways = num_ways n
ways.size    # => 12
num_ways2(n) # => 12
ways
# => [[32, 8, 4],
#     [32, 8, 2, 2],
#     [32, 8, 2, 1, 1],
#     [32, 4, 4, 2, 2],
#     [32, 4, 4, 2, 1, 1],
#     [16, 16, 8, 4],
#     [16, 16, 8, 2, 2],
#     [16, 16, 8, 2, 1, 1],
#     [16, 16, 4, 4, 2, 2],
#     [16, 16, 4, 4, 2, 1, 1],
#     [16, 8, 8, 4, 4, 2, 2],
#     [16, 8, 8, 4, 4, 2, 1, 1]]


num_ways2 10**25 # => 178653872807
