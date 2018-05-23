# https://projecteuler.net/problem=51
require 'set'
require 'prime'

def char_globs(chars, char)
  indexes = chars.each_index.select { |i| chars[i] == char }
  1.upto(indexes.length).flat_map do |n|
    indexes.combination(n).map do |index_combo|
      str = chars.join
      index_combo.each { |i| str[i] = '*'.freeze }
      str
    end
  end
end
char_globs('65003'.chars, '0') # => ["65*03", "650*3", "65**3"]

def all_globs(n)
  chars = n.to_s.chars
  '0'.upto('9').flat_map do |digit|
    char_globs(chars, digit)
  end
end
all_globs 56003 # => ["56*03", "560*3", "56**3", "5600*", "*6003", "5*003"]

def group_globs(n, groups)
  all_globs(n).map do |glob|
    groups[glob] << n
  end
end

def group_for(n)
  groups = Hash.new { |h, k| h[k] = [] }
  Prime.each do |prime|
    group_globs(prime, groups).each do |group|
      return group if group.length == n
    end
  end
end

group_for(6) # => [13, 23, 43, 53, 73, 83]
group_for(7) # => [56003, 56113, 56333, 56443, 56663, 56773, 56993]

group_for(8) # => [121313, 222323, 323333, 424343, 525353, 626363, 828383, 929393]
  .first     # => 121313
