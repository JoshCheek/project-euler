# https://projecteuler.net/problem=169
def num_ways2(n)
  max_power = Math.log(n) / Math.log(2)
  powers    = max_power.to_i.downto(0).each_with_object [] do |power, result|
    next unless 2**power <= n
    n -= 2**power
    result.unshift power
  end

  powers
    .each_cons(2)
    .reduce([powers[0]+1, powers[0]]) { |(sum, sum_without), (prev, crnt)|
      # sum         = number of ways to make the number created by the previous powers
      # sum_without = sum, but without the ways that involve the previous highest power
      #
      # eg if the previous powers were [2, 3], that would correspond to values of
      # [4, 8] (because they are powers of 2) which add up to 12.
      # and (sum, sum_without) = (5, 2) because there are 5 ways to make 12,
      # 2 of which don't involve a 2**3=8

      # To calculate the next sum, we look at how many ways we can make the current
      # power without using the prev highest power. Each of these can be combined
      # with each of the values counted by `sum`, so multiply them together.
      # But we could also make the current power using the previous power, and
      # combining that with all the ways to make `sum`, that don't involve the
      # previous power (aka `sum_without`). There's only one way to make the
      # current power using the preivous power (implicitly: we're not using
      # any powers lower than that)
      new_sum = (crnt-prev)*sum + sum_without
      [new_sum, new_sum-sum]
    }.first
end

# this one wound up being useful for testing
num_ways2 4+8+32 # => 12

num_ways2(10**25) # => 178653872807
