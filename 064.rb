# https://projecteuler.net/problem=64
# Was looking through some old files and realized that I'd sovled this one back in 2009...
# cleaned up the Ruby a lot, but other than that, it's the exact same solution,
# and I haven't taken the tome to try to understand it.

# represents the square root as a continued fraction (for integers)
def self.odd_period?(s)
  s, continued_fraction = s.to_i, []
  if √(s)**2 == s
    continued_fraction << [√(s)]
  else
    m, d, a, a_0 = 0 , 1 , √(s), √(s)
    until continued_fraction.include? to_add = [m,d,a]
      continued_fraction << to_add
      m = d*a-m
      d = (s-m*m)/d
      a = ((1.0*a_0+m)/d).floor
    end
  end
  continued_fraction.map!{|e|e.last}.length.pred.odd?
end

def self.√(n)
  Math.sqrt(n).to_i
end

puts 1.upto(10000).count { |i| odd_period? i }
