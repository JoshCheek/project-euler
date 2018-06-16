# https://projecteuler.net/problem=79
# https://projecteuler.net/project/resources/p079_keylog.txt

class Sequence
  def self.root
    new [[]], []
  end

  def initialize(root, digits)
    @root   = root
    @digits = digits
  end

  def <<(digits)
    self.class.new self, digits
  end

  def each
    return to_enum unless block_given?
    @root.each do |root_digits|
      each_position root_digits.size+1, @digits.size do |positions|
        yield interpolate root_digits, @digits, positions
      end
    end
  end

  private

  def each_position(num_positions, num_insertions)
    if num_insertions <= 0
      yield []
      return
    end
    num_positions.times do |p|
      each_position(p+1, num_insertions-1) { |rest| yield [*rest, p] }
    end
  end

  def interpolate(foundation, insertions, indexes, coalesces=Array.new(foundation.size+insertions.size), fi=0, ii=0)
    no_insertions = insertions.size <= ii
    no_foundation = foundation.size <= fi
    if no_insertions && no_foundation
      []
    elsif no_insertions
      current = foundation[fi]
      rest    = interpolate(foundation, insertions, indexes, coalesces, fi+1, ii)
      rest.unshift current
    elsif no_foundation
      current = insertions[ii]
      rest    = interpolate(foundation, insertions, indexes, coalesces, fi, ii+1)
      rest.unshift current
    elsif indexes[ii] == fi

      current = insertions[ii]
      rest    = interpolate(foundation, insertions, indexes, coalesces, fi, ii+1)
      if coalesces[rest.size]
        rest.unshift current
        coalesces[rest.size] = true # can't coalesce onto this one, either
        rest
      elsif current == rest.first
        coalesces[rest.size] = true
        rest # don't emit current element, it is coalesced into previous
      else
        rest.unshift current
      end
    else
      current = foundation[fi]
      rest    = interpolate(foundation, insertions, indexes, coalesces, fi+1, ii)
      rest.unshift current
    end
  end
end

def each(nums, &block)
  nums.reduce(Sequence.root) { |seq, num| seq << num.digits.reverse }.each(&block)
end

each([680, 180]).min_by do |digits|
  digits
  # => [1, 8, 0, 6, 8, 0]
  #    ,[1, 8, 6, 0, 8, 0]
  #    ,[1, 6, 8, 0, 8, 0]
  #    ,[6, 1, 8, 0, 8, 0]
  #    ,[1, 8, 6, 8, 0]
  #    ,[1, 6, 8, 0]
  #    ,[6, 1, 8, 0]
  #    ,[1, 6, 8, 8, 0]
  #    ,[6, 1, 8, 8, 0]
  #    ,[6, 8, 1, 8, 0]
  #    ,[1, 8, 6, 8, 0, 0]
  #    ,[1, 6, 8, 0, 0]
  #    ,[6, 1, 8, 0, 0]
  #    ,[1, 6, 8, 8, 0, 0]
  #    ,[6, 1, 8, 8, 0, 0]
  #    ,[6, 8, 1, 8, 0, 0]
  #    ,[1, 6, 8, 0, 8, 0]
  #    ,[6, 1, 8, 0, 8, 0]
  #    ,[6, 8, 1, 0, 8, 0]
  #    ,[6, 8, 0, 1, 8, 0]
  digits.length
end
# => [1, 6, 8, 0]


return

# sadly, after all this work, it's still not good enough :(
count = 0
best = nil
result = each(DATA.readlines.map &:to_i).min_by do |digits|
  count += 1
  p count: count, best: best.join if count % 1000 == 0
  if !best || digits.size < best.size
    best = digits.dup
  end
  digits.length
end
p count: count, best: best, result: result

__END__
319
680
180
690
129
620
762
689
762
318
368
710
720
710
629
168
160
689
716
731
736
729
316
729
729
710
769
290
719
680
318
389
162
289
162
718
729
319
790
680
890
362
319
760
316
729
380
319
728
716
