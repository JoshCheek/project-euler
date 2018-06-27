# https://projecteuler.net/problem=196
require "big"

def row(row)
  prime_cache = nil
  prime_cache = build_prime_cache_for_row(row)
  start       = row*(row-1)/2 + 1
  stop        = row*(row+1)/2 + 1

  index = -1
  sum   = BigInt.new "0"
  (start...stop).each do |crnt|
    index += 1
    # p [crnt, index] if index % 1000 == 0
    next unless prime_cache[2][index]
    next unless keep? prime_cache, [[2, index, 2]]
    sum += crnt
  end
  sum
end

def build_prime_cache_for_row(rownum)
  square, root = 0, 0
  primes = [2, 3, 5] of UInt64
  max    = (rownum+2)*(rownum+3)/2+1
  7_u64.upto(Math.sqrt(max).ceil) do |n|
    while square < n
      square = square + 2*root + 1
      root  += 1
    end
    primes.each do |prime|
      if root < prime
        primes << n
        break
      end
      break if n % prime == 0
    end
  end
  # p primes: primes, max: max

  square, root = 0, 0
  offsets = [
    (rownum-2)*(rownum-3)/2 + 1, # => 16, 49975004
    (rownum-1)*(rownum-2)/2 + 1, # => 22, 49985002
    (rownum+0)*(rownum-1)/2 + 1, # => 29, 49995001
    (rownum+1)*(rownum+0)/2 + 1, # => 37, 50005001
    (rownum+1)*(rownum+2)/2 + 1, # => 46, 50015002
    (rownum+2)*(rownum+3)/2 + 1, # => 56, 50025004
  ]
  offsets.each_cons(2).map do |(start, stop)|
    Array.new(stop-start) do |i|
      crnt = i + start
      while square < crnt
        square = square + 2*root + 1
        root  += 1
      end
      is_prime = true
      primes.each do |prime|
        break is_prime = true  if root < prime
        break is_prime = false if crnt % prime == 0
      end
      is_prime ? crnt : nil
    end
  end.to_a
end

def keep?(prime_cache, to_evaluate)
  sum  = 0
  seen = {} of Tuple(Int32, Int32) => Bool
  until to_evaluate.empty?
    row, col, depth = to_evaluate.shift
    next if seen.has_key?({row, col})
    seen[{row, col}] = true
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

3_u64.upto 10_u64 do |i|
  puts row i
end

puts "===== row(8) ====="
result1 = row 8_u64 # 60
puts result1
puts

puts "===== row(10_000) ====="
result2 = row(10_000_u64) # 950007619
puts result2
puts

# puts "===== row(5_678_027) ====="
# result3 = row(5_678_027_u64) # 244862728884940460
# puts result3
# puts
#
# puts "===== row(7_208_785) ====="
# result4 = row(7_208_785_u64) # 187307955442230172705
# puts result4
# puts
#
# puts "===== row(5_678_027) + row(7_208_785)  ====="
# puts result3 + result4 # 187552818171115113165
