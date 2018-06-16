# https://projecteuler.net/problem=79
# https://projecteuler.net/project/resources/p079_keylog.txt

def best_indexes(n1, fst, mid, lst)
  fi = n1.index  fst
  li = n1.rindex lst

  # 3 matches
  if fi && li && fi < li
    (fi+1...li).each do |mi|
      next unless n1[mi] == mid
      return [3, [[nil, nil, nil]]]
    end
  end

  # 2 matches
  bests = []
  if fi && li && fi < li
    (fi+1..li).each do |mi|
      bests << [nil, mi, nil]
    end
  end

  if fi
    (fi+1..n1.size).each do |mi|
      next unless n1[mi] == mid
      (mi+1..n1.size).each do |li|
        bests << [nil, nil, li]
      end
    end
  end

  if li
    (0...li).each do |mi|
      next unless n1[mi] == mid
      (0..mi).each { |fi| bests << [fi, nil, nil] }
    end
  end

  bests.uniq!
  return [2, bests] if bests.any?

  # 0 matches
  if !fi && !li && !n1.index(mid)
    return [
      0,
      Enumerator.new do |y|
        0.upto(n1.size) do |fi|
          fi.upto(n1.size) do |mi|
            mi.upto(n1.size) { |li| y << [fi, mi, li] }
          end
        end
      end
    ]
  end

  # 1 match
  return [
    1,
    Enumerator.new do |y|
      if fi
        (fi+1..n1.size).each do |mi|
          (mi..n1.size).each { |li| y << [nil, mi, li] }
        end
      end

      if li
        (0..li).each do |mi|
          (0..mi).each { |fi| y << [fi, mi, nil] }
        end
      end

      n1.each_with_index do |e, mi|
        next unless e == mid
        (0..mi).each do |fi|
          (mi+1..n1.size).each do |li|
            y << [fi, nil, li]
          end
        end
      end
    end
  ]
end

def count(n1, n2)
  count, _ = best_indexes n1, *n2
  count
end


def keep_shorties(arrays)
  size = arrays.min_by(&:size).size
  arrays.select { |n| n.size == size }
end

def find_best(aggregate, nums)
  new_nums = nums.map do |n|
    num_overlaps, replacements = best_indexes(aggregate, *n)
    [num_overlaps, n, replacements]
  end
  best_count = new_nums.max.first
  new_nums.select! { |count, n, replacements| count == best_count }

  # don't bother with this optimisation when there was only one match,
  # b/c counting them, will be expensive
  if 1 < best_count
    new_nums.sort_by! { |_, _, replacements| replacements.count }
  end

  _, best_num, replacements = new_nums.first
  return best_num, replacements
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

nums = [
  319, 680, 180, 690, 129, 620, 762, 689, 762, 318,
  368, 710, 720, 710, 629, 168, 160, 689, 716, 731,
  736, 729, 316, 729, 729, 710, 769, 290, 719, 680,
  318, 389, 162, 289, 162, 718, 729, 319, 790, 680,
  890, 362, 319, 760, 316, 729, 380, 319, 728, 716,
].map { |n| n.digits.reverse }


aggregates = [
  nums.combination(2).sort_by { |n1, n2| -count(n1, n2) }.first.first
]

until nums.empty?
  candidates = aggregates.map do |aggregate|
    n, replacements = find_best aggregate, nums
    new_aggregates = build_interpolations aggregate, n, replacements
    [new_aggregates.map(&:size).min, n]
  end
  num = candidates.min_by(&:first).last
  nums.delete num
  aggregates = aggregates.flat_map do |aggregate|
    _, replacements = best_indexes aggregate, *num
    build_interpolations aggregate, num, replacements
  end
  aggregates.uniq!
  aggregates = keep_shorties aggregates
end

aggregates.join  # => "73162890"
