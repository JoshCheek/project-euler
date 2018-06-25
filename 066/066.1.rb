# https://projecteuler.net/problem=66
@squares    = []
@max_square = 0
def square?(n)
  while @squares.size < n
    @squares[@max_square**2] = @max_square
    @max_square += 1
  end
  @squares[n]
end

best = nil
2.upto(1000)
 .reject { |d| square? d }
 .map do |d|
   break if d == 54
   result = 1.step do |y|
     xsquared = 1 + d * y * y
     x = square? xsquared
     break {x: x, d: d, y: y} if x
   end
   if !best || (best[:x] < result[:x])
     best = result
   end
   p d => result
 end
 # .max_by { |x:, **| x } # =>
 # .[](:d)                # =>
