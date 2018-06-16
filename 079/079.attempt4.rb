# https://projecteuler.net/problem=79
# https://projecteuler.net/project/resources/p079_keylog.txt

def best_indexes(n, fst, mid, lst)
  fi = n.index  fst
  li = n.rindex lst

  # 3 matches
  fi && li && fi < li && (fi+1...li).each do |mi|
    n[mi] == mid and return [3, [[nil, nil, nil]]]
  end

  # 2 matches
  bests = []

  fi && li && fi < li && (fi+1..li).each { |mi| bests << [nil, mi, nil] }

  fi && (fi+1..n.size).each do |mi|
    n[mi] == mid && (mi+1..n.size).each { |li| bests << [nil, nil, li] }
  end

  li && (0...li).each do |mi|
    n[mi] == mid && (0..mi).each { |fi| bests << [fi, nil, nil] }
  end

  bests.uniq!
  bests.any? and return [2, bests]

  # 0 matches
  !fi && !li && !n.index(mid) and return [
    0,
    Enumerator.new do |y|
      0.upto(n.size) do |fi|
        fi.upto(n.size) do |mi|
          mi.upto(n.size) { |li| y << [fi, mi, li] }
        end
      end
    end
  ]

  # 1 match
  return [
    1,
    Enumerator.new do |y|
      fi && (fi+1..n.size).each do |mi|
        (mi..n.size).each { |li| y << [nil, mi, li] }
      end

      li && (0..li).each do |mi|
        (0..mi).each { |fi| y << [fi, mi, nil] }
      end

      n.each_with_index do |e, mi|
        e == mid && (0..mi).each do |fi|
          (mi+1..n.size).each { |li| y << [fi, nil, li] }
        end
      end
    end
  ]
end

def keep_shorties!(arrays)
  size = arrays.min_by(&:size).size
  arrays.select! { |n| n.size == size }
end

def build_interpolations(base, (f, m, l), replacements)
  replacements.map do |fi, mi, li|
    crnt = base.dup
    crnt.insert li, l if li
    crnt.insert mi, m if mi
    crnt.insert fi, f if fi
    crnt
  end
end

def find_best(aggs, nums)
  nums.min_by do |num|
    aggs.map { |agg|
      num_overlaps, _replacements = best_indexes(agg, *num)
      num_insertions = 3 - num_overlaps
      agg.size - num_insertions
    }.min
  end
end


nums = [
  319, 680, 180, 690, 129, 620, 762, 689, 762, 318,
  368, 710, 720, 710, 629, 168, 160, 689, 716, 731,
  736, 729, 316, 729, 729, 710, 769, 290, 719, 680,
  318, 389, 162, 289, 162, 718, 729, 319, 790, 680,
  890, 362, 319, 760, 316, 729, 380, 319, 728, 716,
].map { |n| n.digits.reverse }


aggregates = [
  nums.combination(2).min_by { |n1, n2|
    count, _ = best_indexes n1, *n2
    -count
  }.first
]

until nums.empty?
  num = find_best aggregates, nums
  nums.delete num
  aggregates = aggregates.flat_map do |aggregate|
    _, replacements = best_indexes aggregate, *num
    build_interpolations aggregate, num, replacements
  end
  aggregates.uniq!
  keep_shorties! aggregates
end

aggregates.join  # => "73162890"
