# https://projecteuler.net/problem=85

sums_1_row = []
1.upto(Float::INFINITY).each do |x|
  sums_1_row << x + (sums_1_row[-1]||0)
  break if sums_1_row[-1] > 2_000_000
end

sums_1_row.size

all_sums = [sums_1_row]
sums_1_row.drop(1).each do |y|
  all_sums << sums_1_row.map { |n| n*y }
  break if all_sums.last.all? { |n| n > 2_000_000 }
end

best = all_sums.flatten.min_by { |n| (2_000_000-n).abs }

bests = all_sums.each.with_index(1).flat_map do |sums, y|
  sums.each.with_index(1).select { |n,  x| n == best }.map { |n, x| [x, y] }
end

bests                             # => [[77, 36], [36, 77]]
bests.map { |x, y| x * y }.first  # => 2772

