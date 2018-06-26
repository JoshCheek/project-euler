# https://projecteuler.net/problem=196
def time
  start = Time.now
  yield
  Time.now - start
end

def row(row)
  prime_cache = nil
  # p time {
    prime_cache = build_prime_cache_for_row(row)
  # }
  start       = row*(row-1)/2 + 1
  stop        = row*(row+1)/2 + 1
  (start...stop)
    .map.with_index
    .lazy
    .select { |crnt, i|
      # p [crnt, i] if i % 1000 == 0
      next false unless prime_cache[2][i]
      keep? prime_cache, [[2, i, 2]]
    }
    .map { |crnt, i| crnt }
    .sum
end

def build_prime_cache_for_row(rownum)
  square, root = 0, 0
  primes, max = [], (rownum+2)*(rownum+3)/2+1
  2.upto(Math.sqrt(max).ceil) do |n|
    while square < n
      square = square + 2*root + 1
      root  += 1
    end
    next unless primes.each do |prime|
      break true  if root < prime
      break false if n % prime == 0
    end
    primes << n
  end

  square, root = 0, 0
  [ (rownum-2)*(rownum-3)/2 + 1, # => 16, 49975004
    (rownum-1)*(rownum-2)/2 + 1, # => 22, 49985002
    (rownum+0)*(rownum-1)/2 + 1, # => 29, 49995001
    (rownum+1)*(rownum+0)/2 + 1, # => 37, 50005001
    (rownum+1)*(rownum+2)/2 + 1, # => 46, 50015002
    (rownum+2)*(rownum+3)/2 + 1, # => 56, 50025004
  ].each_cons(2).map do |start, stop|
    Array.new(stop-start) do |i|
      crnt = i + start
      while square < crnt
        square = square + 2*root + 1
        root  += 1
      end
      next crnt if primes.each do |prime|
        break true  if root < prime
        break false if crnt % prime == 0
      end
    end
  end
end

def keep?(prime_cache, to_evaluate)
  sum  = 0
  seen = {}
  until to_evaluate.empty?
    row, col, depth = to_evaluate.shift
    next if seen[[row, col]]
    seen[[row, col]] = true
    next unless prime_cache[row][col]
    sum += 1
    return true if 3 <= sum
    next if depth.zero?

    to_evaluate << [row-1, col-1, depth-1] if 0     < col
    to_evaluate << [row-1, col,   depth-1] if col   < prime_cache[row-1].size
    to_evaluate << [row-1, col+1, depth-1] if col+1 < prime_cache[row-1].size

    to_evaluate << [row, col-1, depth-1]   if 0 < col
    to_evaluate << [row, col+1, depth-1]   if col+1 < prime_cache[row].size

    to_evaluate << [row+1, col-1, depth-1] if 0 < col
    to_evaluate << [row+1, col,   depth-1]
    to_evaluate << [row+1, col+1, depth-1]
  end
  false
end

60 == row(8)            # => true
950007619 == row(10000) # => true

# p row(5_678_027) # =>
