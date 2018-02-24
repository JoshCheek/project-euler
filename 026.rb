# https://projecteuler.net/problem=26

def frac(den)
  remaining = 1
  seen = []
  repeat_index = nil
  until remaining.zero?
    remaining *= 10
    _, remaining = crnt = remaining.divmod(den)
    break if repeat_index = seen.index(crnt)
    seen << crnt
  end
  repeat_index ||= seen.length
  seen = seen.map(&:first)
  return seen[0...repeat_index], seen[repeat_index..-1]
end

target = (1...1000).max_by do |i|
  pre, recurring = frac i
  recurring.length
end

pre, recurring = frac target
pre               # => []
recurring.length  # => 982
recurring.take 10 # => [0, 0, 1, 0, 1, 7, 2, 9, 3, 9]
target            # => 983
