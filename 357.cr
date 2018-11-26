# https://projecteuler.net/problem=357
class SeiveSlot
  property number, prime, generator

  def initialize(@number : Int32)
    @prime = true
    @generator = true
  end

  def prime?
    @prime
  end

  def generator?
    @generator
  end

  def add_divisor_for_primes(divisor : Int32)
    @prime = false if divisor != 1 && divisor != @number
    nil
  end

  def add_divisor_for_generator(divisor : Int32, seive : Array(SeiveSlot))
    return unless generator?
    generated = divisor + @number/divisor
    @generator = false unless seive[generated-1].prime?
    nil
  end
end

top = 100_000_000
max_idx = top+1
seive = Array(SeiveSlot).build max_idx do |buffer|
  max_idx.times { |i| buffer[i] = SeiveSlot.new i+1 }
  max_idx
end
puts "allocated"

seive.each do |slot|
  divisor = slot.number
  next if divisor < 2
  p "finding primes: #{divisor}" if divisor % 100_000 == 0
  multiplier = 1
  loop do
    multiple = divisor*multiplier
    break if seive.size < multiple
    seive[multiple-1].add_divisor_for_primes divisor
    multiplier += 1
  end
end

seive.first(top).each do |slot|
  divisor = slot.number
  p "finding generators: #{divisor}" if divisor % 100_000 == 0
  multiplier = 1
  loop do
    multiple = divisor*multiplier
    break if seive.size <= multiple
    seive[multiple-1].add_divisor_for_generator divisor, seive
    multiplier += 1
  end
end

sum = 0_u64
seive.each { |slot|
  next if seive.size <= slot.number
  next unless slot.generator?
  # p slot.number
  sum += slot.number
}

p sum: sum # => {sum: 1739023853137_u64}
