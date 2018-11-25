# https://projecteuler.net/problem=196
require "./tmp"

struct Point
  property x, y
  def initialize(@x : Int32, @y : Int32)
  end
end

def rows_for(n)
  (n-2).upto(n+2).map do |i|
    start = i * (i-1) / 2 + 1
    stop  = i * (i+1) / 2
    (start..stop).to_a
  end.to_a
end

def sum_triples(rows, primes)
  rows[2]
    .each_index
    .select { |x| count(rows, primes, x, 2, [] of Point) >= 3 }
    .map { |x| rows[2][x] }
    .sum
end

def count(rows, primes, x, y, path)
  crnt = Point.new(x, y)
  already_traversed = path.includes? crnt
  path.push crnt

  return 0 if already_traversed
  return 0 if path.size > 3
  return 0 if x < 0 || y < 0 || 4 < y || rows[y].size <= x

  num = rows[y][x]
  return 0 unless primes.include?(num)
  return 1 if path.size == 3
  1 + [
    Point.new(x-1, y-1),
    Point.new(x-1, y  ),
    Point.new(x-1, y+1),

    Point.new(x, y-1),
    Point.new(x, y  ),
    Point.new(x, y+1),

    Point.new(x+1, y-1),
    Point.new(x+1, y  ),
    Point.new(x+1, y+1),
  ].sum { |pt| count rows, primes, pt.x, pt.y, path }
ensure
  path.pop if path.last == crnt
end

primes = Primes.new 5_097_382_u64
p sum_triples(rows_for(8_u64), primes)
p sum_triples(rows_for(9_u64), primes)
p sum_triples(rows_for(10000_u64), primes)

n1 = sum_triples(rows_for(5678027_u64), primes)
p n1 # 79697256800321526_u64

n2 = sum_triples(rows_for(7208785_u64), primes)
p n2 # 242605983970758409_u64

p n1 + n2 # 322303240771079935_u64
