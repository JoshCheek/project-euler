# https://projecteuler.net/problem=628
def num_open(n)
  mod   = 1_008_691_207

  # iterate from 1 to n, but start 2 iterations in (at 3) so we can cache calculations
  total = 0
  fact1 = 2 # current iteration: 2!
  fact2 = 1 # 1 iteration ago:   1!
  fact3 = 1 # 2 iterations ago:  0!

  3.upto n do |i|
    total = (total + (n-i+1)*fact3 - fact1) % mod
    fact3 = fact2
    fact2 = fact1
    fact1 = (fact1 * i) % mod
  end

  (total + fact1 - fact2 - 1) % mod
end

num_open 10**8  # => 210286684




return

# The unoptimized work:
def fact(n)
  1.upto(n).reduce(1, :*)
end

def num_open(n)
  total = fact(n)
  1.upto(n)   { |i| total -= fact(n-i)     }
  1.upto(n-1) { |i| total += fact(n-i-1)   }
  1.upto(n-1) { |i| total -= fact(n-i)     }
  1.upto(n-2) { |i| total += i*fact(n-i-2) }
  total
end

num_open 3 # => 2
num_open 4 # => 12
num_open 5 # => 70
num_open 6 # => 464


# explore the grids for n=4
__END__
X    x    X    x    x    x
0001 0001 0001 0001 0001 0001
0010 0010 0100 0100 1000 1000
0100 1000 0010 1000 0100 0010
1000 0100 1000 0010 0010 0100

X    x    X
0010 0010 0010 0010 0010 0010
0001 0001 0100 0100 1000 1000
0100 1000 0001 1000 0001 0100
1000 0100 1000 0001 0100 0001

          X         X
0100 0100 0100 0100 0100 0100
1000 1000 0010 0010 0001 0001
0001 0010 0001 1000 0010 1000
0010 0001 1000 0001 1000 0010

     x
1000 1000 1000 1000 1000 1000
0100 0100 0010 0010 0001 0001
0001 0010 0001 0100 0010 0100
0010 0001 0100 0001 0100 0010


00001 00001 00010 00010 00100 00100
00010 00100 00001 00100 00001 00010
00100 00010 00100 00001 00010 00001
10000 10000 10000 10000 10000 10000
01000 01000 01000 01000 01000 01000
