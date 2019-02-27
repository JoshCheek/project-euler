require 'set'
squares = Set.new
pairs   = Hash.new { |h, k| h[k] = Set.new }

0.step do |root|
  square = root * root
  squares << square

  low   = 1
  high  = square - 1
  added = []
  while low < high
    # These add up to a square, so the question is: do they subtract to a square, too?
    # If so, they're a valid pair (x, y) or (x, z) or (y, z)
    if squares.include? high - low
      pairs[low]  << high
      pairs[high] << low
      added << [low, high]
    end
    low += 1
    high -= 1
  end

  # check each of the pairs we just found to see if they each pair with a common third value
  added.each do |low, high|
    low_pairs = pairs[low]
    pairs[high].each do |third|
      if low_pairs.include? third
        # took about 14 seconds
        # {:low=>420968, :high=>434657, :third=>150568, :sum=>1006193}
        p low: low, high: high, third: third, sum: low + high + third
        exit
      end
    end
  end
end
