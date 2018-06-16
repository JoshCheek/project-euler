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

  def each(&block)
    return to_enum unless block
    @root.each do |root_digits|
      interpolations = each_position(root_digits.size+1, @digits.size).map do |positions|
        interpolate root_digits, @digits, positions
      end
      interpolations.sort_by!(&:size)
      interpolations.each(&block)
    end
  end

  private

  def each_position(num_positions, num_insertions)
    return to_enum :each_position, num_positions, num_insertions unless block_given?
    if num_insertions <= 0
      yield []
      return
    end
    num_positions.times do |p|
      each_position(p+1, num_insertions-1) { |rest| yield [*rest, p] }
    end
  end

  COALESCES = Array.new 150

  # not threadsafe
  def interpolate(foundation, insertions, indexes)
    COALESCES.map! { nil }
    do_interpolate foundation, insertions, indexes, COALESCES, 0, 0
  end

  def do_interpolate(foundation, insertions, indexes, coalesces, fi, ii)
    no_insertions = insertions.size <= ii
    no_foundation = foundation.size <= fi
    if no_insertions && no_foundation
      []
    elsif no_insertions
      do_interpolate(foundation, insertions, indexes, coalesces, fi+1, ii).unshift foundation[fi]
    elsif no_foundation
      do_interpolate(foundation, insertions, indexes, coalesces, fi, ii+1).unshift insertions[ii]
    elsif indexes[ii] == fi
      current = insertions[ii]
      rest    = do_interpolate(foundation, insertions, indexes, coalesces, fi, ii+1)
      if coalesces[rest.size]
        rest.unshift(current).tap { coalesces[rest.size] = true } # prev was coalesced, so this was inserted and can't be coalesced
      elsif current == rest.first
        rest.tap { coalesces[rest.size] = true } # coalesce the current element
      else
        rest.unshift current
      end
    else
      do_interpolate(foundation, insertions, indexes, coalesces, fi+1, ii).unshift foundation[fi]
    end
  end
end

def each(nums, &block)
  nums.reduce(Sequence.root) { |seq, num| seq << num.digits.reverse }.each(&block)
end

each([68, 18, 88]).take(15)
# => [[8, 1, 6, 8],
#     [8, 1, 6, 8],
#     [1, 8, 6, 8],
#     [1, 6, 8, 8],
#     [1, 6, 8, 8],
#     [1, 8, 6, 8],
#     [8, 1, 8, 6, 8],
#     [1, 6, 8, 8, 8],
#     [8, 1, 6, 8, 8],
#     [1, 8, 6, 8, 8],
#     [8, 6, 1, 8],
#     [8, 6, 1, 8],
#     [6, 8, 1, 8],
#     [6, 1, 8, 8],
#     [6, 1, 8, 8]]

each([680, 180, 880]).take(40)
# => [[6, 8, 1, 8, 0],
#     [8, 6, 1, 8, 0],
#     [6, 1, 8, 8, 0],
#     [8, 6, 1, 8, 0],
#     [6, 1, 8, 8, 0],
#     [6, 8, 1, 8, 0],
#     [8, 6, 8, 1, 8, 0],
#     [8, 0, 6, 1, 8, 0],
#     [8, 6, 0, 1, 8, 0],
#     [6, 8, 0, 1, 8, 0],
#     [8, 6, 1, 0, 8, 0],
#     [6, 8, 1, 0, 8, 0],
#     [6, 1, 8, 0, 8, 0],
#     [8, 6, 1, 8, 8, 0],
#     [6, 8, 1, 8, 8, 0],
#     [6, 1, 8, 8, 8, 0],
#     [8, 6, 1, 8, 0, 0],
#     [6, 8, 1, 8, 0, 0],
#     [8, 6, 1, 8, 0, 0],
#     [6, 8, 1, 8, 0, 0],
#     [6, 1, 8, 8, 0, 0],
#     [6, 1, 8, 8, 0, 0],
#     [6, 1, 8, 8, 0, 0],
#     [6, 1, 8, 0, 8, 0],
#     [6, 1, 8, 8, 0, 8, 0],
#     [8, 6, 1, 8, 0, 8, 0],
#     [8, 6, 8, 1, 0, 8, 0],
#     [8, 6, 1, 8, 0, 8, 0],
#     [6, 8, 1, 8, 0, 8, 0],
#     [8, 6, 8, 0, 1, 8, 0],
#     [8, 6, 1, 8, 8, 0, 0],
#     [6, 8, 1, 8, 8, 0, 0],
#     [8, 6, 8, 1, 8, 0, 0],
#     [6, 1, 8, 0, 8, 8, 0],
#     [6, 8, 1, 8, 0, 8, 0],
#     [1, 8, 6, 8, 0],
#     [8, 1, 6, 8, 0],
#     [1, 6, 8, 8, 0],
#     [8, 1, 6, 8, 0],
#     [1, 6, 8, 8, 0]]

each([680, 180]).take(1) # => [[6, 1, 8, 0]]


return

# wrong answer :(
puts each(DATA.readlines.map &:to_i).take(10_000).min_by(&:size).join

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
