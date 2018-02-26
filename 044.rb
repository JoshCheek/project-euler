# https://projecteuler.net/problem=44

pentagonals = Enumerator.new do |y|
  1.step { |i| y << i * (3*i-1) / 2 }
end

require 'set'
max   = pentagonals.next
known = Set[max]
Enumerator.new do |y|
  pentagonals.each do |p1|
    pentagonals.each do |p2|
      break if p1 <= p2
      sum = p1+p2
      while max < sum
        max = pentagonals.next
        known << max
      end
      next unless known.include? sum
      next unless known.include? p1-p2
      y << [p1, p2]
    end
  end
end.first # => [7042750, 1560090]
   .tap { |p1, p2| break p1 - p2 } # => 5482660
