# https://projecteuler.net/problem=60
require 'prime'

def make_room_for(n)
  i = 10
  i *= 10 while i < n
  i
end

def num_concat(n1, n2)
  n1 * make_room_for(n2) + n2
end

def add_to_set?(potential, set)
  set.all? do |crnt|
    num_concat(potential, crnt).prime? &&
      num_concat(crnt, potential).prime?
  end
end

prime_sets = []
Prime.each_with_index do |prime, i|
  if i % 100 == 0
    sizes = prime_sets.group_by(&:size).sort.map { |n, sets| [n, sets.size] }.to_h
    p i: i, prime: prime, num_sets: prime_sets.size, sizes: sizes
  end
  prime_sets = prime_sets.flat_map do |prime_set|
    if add_to_set? prime, prime_set
      new_set = [prime, *prime_set]
      if new_set.size == 5
        p new_set, new_set.sum
        exit
      end
      [prime_set, new_set]
    else
      [prime_set]
    end
  end
  prime_sets << [prime]
end

# {:i=>0, :prime=>2, :num_sets=>0, :sizes=>{}}
# {:i=>100, :prime=>547, :num_sets=>426, :sizes=>{1=>100, 2=>284, 3=>42}}
# {:i=>200, :prime=>1229, :num_sets=>1410, :sizes=>{1=>200, 2=>944, 3=>264, 4=>2}}
# {:i=>300, :prime=>1993, :num_sets=>2520, :sizes=>{1=>300, 2=>1698, 3=>516, 4=>6}}
# {:i=>400, :prime=>2749, :num_sets=>3945, :sizes=>{1=>400, 2=>2668, 3=>865, 4=>12}}
# {:i=>500, :prime=>3581, :num_sets=>5553, :sizes=>{1=>500, 2=>3764, 3=>1270, 4=>19}}
# {:i=>600, :prime=>4421, :num_sets=>7482, :sizes=>{1=>600, 2=>5060, 3=>1787, 4=>35}}
# {:i=>700, :prime=>5281, :num_sets=>9837, :sizes=>{1=>700, 2=>6598, 3=>2494, 4=>45}}
# {:i=>800, :prime=>6143, :num_sets=>12824, :sizes=>{1=>800, 2=>8407, 3=>3546, 4=>71}}
# {:i=>900, :prime=>7001, :num_sets=>15978, :sizes=>{1=>900, 2=>10342, 3=>4637, 4=>99}}
# {:i=>1000, :prime=>7927, :num_sets=>19527, :sizes=>{1=>1000, 2=>12501, 3=>5902, 4=>124}}
# [8389, 6733, 5701, 5197, 13]
# 26033
