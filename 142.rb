require 'set'
@gen_squares = Enumerator.new do |y|
  0.step { |i| y << i*i }
end
@squares = Set.new
@max = @gen_squares.next
@squares << @max

def square?(n)
  while @max < n
    @max = @gen_squares.next
    @squares << @max
  end
  @squares.include? n
end


gen_pairs = Enumerator.new do |y|
  2.step do |a|
    1.upto a.pred do |b|
      next unless square? a-b
      next unless square? a+b
      y << [a, b]
    end
  end
end

# keys are always larger than values
pairs = Hash.new { |h, k| h[k] = [] }
gen_pairs.each do |x, y|
  p x: x
  if (z = (pairs[x] & pairs[y]).min)
    p x: x, y: y, z: z, sum: x+y+z
    exit
  end
  pairs[x] << y
end
