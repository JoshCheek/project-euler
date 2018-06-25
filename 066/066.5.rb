# https://projecteuler.net/problem=66
require 'bigdecimal'

# Convergents of the continued fraction expansion of n
def convergents(n)
  Enumerator.new do |y|
    first = n.floor
    n     = 1 / (n-first)
    rest  = []
    loop do
      a = n.floor
      n = 1 / (n-a)
      rest.unshift a
      y << first + rest.reduce(0r) { |c, a| 1/(c+a) }
    end
  end
end

def solution(d)
  precision = 0
  sqrt      = Math.sqrt d
  loop do
    convergents(sqrt).each.with_index 1 do |rational, i|
      break nil if i > 80 # NOTE that this is tuned for d <= 1000
      x = rational.numerator
      y = rational.denominator
      next unless x*x == 1 + d*y*y
      return {d: d, x: x, y: y, iterations: i, precision: precision}
    end
    precision += d/2
    sqrt = BigDecimal.new(d.to_s).sqrt(precision)
  end
end

1.upto(1000)
 .reject { |d| d == Math.sqrt(d).to_i**2 }
 .map    { |d| solution d }
 .max_by { |s| s[:x] } # => {:d=>661, :x=>16421658242965910275055840472270471049, :y=>638728478116949861246791167518480580, :iterations=>77, :precision=>660}
 .slice(:d)            # => {:d=>661}
