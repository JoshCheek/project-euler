# https://projecteuler.net/problem=66
require 'bigdecimal'

def solution(d)
  precision, sqrt = 0, Math.sqrt(d) # first use a float b/c it's way the fuck faster

  loop do
    first = sqrt.floor
    n     = 1 / (sqrt-first)
    rest  = [] # continued fractional expansion of the sqrt of d

    # all solutions can be found within 80 iterations (based on measuring)
    # if we exceed 80, it means our numbers are off b/c we don't have enough precision in our sqrt
    1.step to: 80 do |i|
      # expand the fraction and calculate the convergent
      a = n.floor
      n = 1 / (n-a)
      rest.unshift a
      convergent = first + rest.reduce(0r) { |c, a| 1/(c+a) }

      # check if the convergent is a solution
      x = convergent.numerator
      y = convergent.denominator
      next unless x*x == 1 + d*y*y
      return {d: d, x: x, y: y, iterations: i, precision: precision}
    end

    # try again with a BigDecimal and more precision
    precision += d/2
    sqrt = BigDecimal.new(d.to_s).sqrt(precision)
  end
end

1.upto(1000)
 .reject { |d| d == Math.sqrt(d).to_i**2 }
 .map    { |d| solution d }
 .max_by { |s| s[:x] } # => {:d=>661, :x=>16421658242965910275055840472270471049, :y=>638728478116949861246791167518480580, :iterations=>77, :precision=>660}
 .fetch(:d)            # => 661
