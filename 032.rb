# https://projecteuler.net/problem=32

def make_num(digits, start, stop)
  num = 0
  for i in start...stop
    num = num*10 + digits[i]
  end
  num
end

def each_partition(digits)
  len = digits.length-1
  1.upto len do |i|
    1.upto len do |j|
      n1 = make_num digits,   0,     i
      n2 = make_num digits,   i,   i+j
      n3 = make_num digits, i+j, len+1
      break if n1*n2 > n3
      yield n1, n2, n3
    end
  end
end

matches = []
[*1..9].permutation do |perm|
  each_partition perm do |n1, n2, n3|
    matches << [n1, n2, n3] if n1 * n2 == n3
  end
end

matches
# => [[12, 483, 5796],
#     [138, 42, 5796],
#     [157, 28, 4396],
#     [159, 48, 7632],
#     [1738, 4, 6952],
#     [18, 297, 5346],
#     [186, 39, 7254],
#     [1963, 4, 7852],
#     [198, 27, 5346],
#     [27, 198, 5346],
#     [28, 157, 4396],
#     [297, 18, 5346],
#     [39, 186, 7254],
#     [4, 1738, 6952],
#     [4, 1963, 7852],
#     [42, 138, 5796],
#     [48, 159, 7632],
#     [483, 12, 5796]]

matches.map(&:last) # => [5796, 5796, 4396, 7632, 6952, 5346, 7254, 7852, 5346, 5346, 4396, 5346, 7254, 6952, 7852, 5796, 7632, 5796]
       .uniq        # => [5796, 4396, 7632, 6952, 5346, 7254, 7852]
       .sum         # => 45228
