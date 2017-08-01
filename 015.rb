# https://projecteuler.net/problem=15
class Integer
  def choose(r)
    self.! / r.! / (self - r).!
  end
  def !
    1.upto(self).reduce(1, :*)
  end
end

def grid(len)
  (len*2).choose(len)
end

grid 2 # => 6
grid 20 # => 137846528820
