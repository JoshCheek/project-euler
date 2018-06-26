# https://projecteuler.net/problem=196
require 'prime'

def row(n)
  prime = Hash.new { |h, n| h[n] = n.prime? }
  start = n*(n-1)/2 + 1
  stop  = n*(n+1)/2
  (start..stop)
    .map.with_index
    .lazy
    .select { |crnt, i|
      # p [crnt, i] if i % 1000 == 0
      next false unless prime[crnt]
      keep? prime, [[crnt, n, i, 2]]
    }
    .map { |crnt, i| crnt }
    .sum
end

def keep?(prime, to_evaluate)
  sum  = 0
  seen = {}
  until to_evaluate.empty?
    # note: col counts from 0, row counts from 1
    crnt, row, col, depth = to_evaluate.shift
    next if seen[crnt]
    seen[crnt] = true
    next unless prime[crnt]
    sum += 1
    return true if 3 <= sum
    next if depth.zero?
    prev = crnt - (row-1)
    to_evaluate << [prev-1, row-1, col-1, depth-1] if 0 < col
    to_evaluate << [prev,   row-1, col,   depth-1] if col < row-1
    to_evaluate << [prev+1, row-1, col+1, depth-1] if col < row-2

    to_evaluate << [crnt-1, row, col-1, depth-1]   if 0 < col
    to_evaluate << [crnt+1, row, col+1, depth-1]   if (col+1) < row

    succ = crnt + row
    to_evaluate << [succ-1, row+1, col-1, depth-1] if 0 < col
    to_evaluate << [succ,   row+1, col,   depth-1]
    to_evaluate << [succ+1, row+1, col+1, depth-1]
  end
  false
end

60 == row(8)            # => true
950007619 == row(10000) # => true

# p row(5_678_027) # =>
