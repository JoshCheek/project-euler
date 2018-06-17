# https://projecteuler.net/problem=100
# There were a few attempts before this, but I didn't save them,
# this is the first one that would have worked, but was just slow

class OddSquares
  attr_reader :root

  def initialize(root)
    @root = root
    @root -= 1 unless @root.odd?
    @square = @root*@root
  end

  def value
    @square
  end

  def pred
    @root   -= 2
    @square -= 4*@root+4
  end

  def succ
    @root   += 2
    @square += 4*@root-4
  end
end

def show(r, root)
  b = (2*r + 1 + root)/2
  p b: b, r: r, a: b+r
end
a = 10**12          # => 1000000000000
b = a/Math.sqrt(2)  # => 707106781186.5475
r = a-b             # => 292893218813.4525

# I ran it a while
# r = 303_110_000_000
r = 293_746_000_000
# r = 1

squares = OddSquares.new Math.sqrt(8*r*r+1).to_i

r.to_i.step do |r|
  s = 8*r*r+1
  nil while squares.succ < s
  val  = squares.value
  root = squares.root
  squares.pred
  show r, root if r%1_000_000 == 0
  next unless val == s
  puts "WINNING!"
  show r, root
  break
end
