# https://projecteuler.net/problem=76
@memo = {}
def ways(target, limit=target)
  @memo.fetch [target, limit] do |key|
    count = 0
    (1...limit).each do |i|
      count += 1 if target % i == 0
      crnt = target
      while i < crnt
        crnt -= i
        count += ways(crnt, i)
      end
    end
    @memo[key] = count
  end
end

ways 100 # => 190569291
