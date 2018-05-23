# https://projecteuler.net/problem=250
# wrote this in like 2009, and it worked, so I'm rolling with it
class Integer
  def odd?
    self%2==1
  end
  def prev
    self-1
  end
  def power_mod_target(p)
    (p==1 ? self    :    p.odd? ? power_mod_target(p.prev>>1)**2 * self % $target    :    power_mod_target(p>>1)**2) % $target
  end
end

class Array
  def introduce(n)
    copy=self.dup
    (0...$target).each{|i| self[(i+n) % $target] = (copy[i] + copy[(i+n) % $target]) % 10_000_000_000_000_000 }
    self[n] += 1
    self
  end
end

$target    =  250
solutions  =  Array.new($target,0)
1.upto(250250){|n| solutions.introduce(n.power_mod_target(n)) }
puts solutions[0]
