# https://projecteuler.net/problem=45

triangles = Enumerator.new do |y|
  1.step { |n| y << n * (n+1) / 2 }
end

pentagonals = Enumerator.new do |y|
  1.step { |n| y << n * (3*n-1) / 2 }
end

hexagonals = Enumerator.new do |y|
  1.step { |n| y << n * (2*n-1) }
end

all_three = Enumerator.new do |y|
  seen = Hash.new { |h, k| h[k] = [false, false, false] }
  loop do
    t = triangles.next
    p = pentagonals.next
    h = hexagonals.next
    seen[t][0] = true
    seen[p][1] = true
    seen[h][2] = true
    y << t if seen[t] == [true, true, true]
  end
end

all_three.take(3) # => [1, 40755, 1533776805]
         .last    # => 1533776805

