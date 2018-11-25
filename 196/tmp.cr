class Primes
  def initialize(max_internal)
    @primes = [2_u64, 3_u64, 5_u64]
    @primes.last.succ.upto max_internal do |i|
      @primes << i if include? i
    end
  end

  def include?(n)
    return false if n < 2_u64
    root = Math.sqrt n
    @primes.each do |prime|
      return false if n % prime == 0
      return true  if root < prime
    end
    true
  end
end
