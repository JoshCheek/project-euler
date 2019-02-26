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

3.step do |x|
  p x: x if x % 1000 == 0
  x.pred.downto 2 do |y|
    next unless square?(x-y)
    next unless square?(x+y)
    y.pred.downto 1 do |z|
      next unless square?(y-z)
      next unless square?(x-z)
      next unless square?(x+z)
      next unless square?(y+z)
      p x: x, y: y, z: z, sum: x+y+z
      exit
    end
  end
end
