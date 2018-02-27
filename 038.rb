# https://projecteuler.net/problem=38

bases = Enumerator.new do |y|
  d1 = 9
  y << d1
  0.upto 9 do |d2|
    next if d2 == d1
    y << d1*10 + d2
    0.upto 9 do |d3|
      next if d3 == d1 || d3 == d2
      y << d1*100 + d2*10 + d3
      0.upto 9 do |d4|
        next if d4 == d1 || d4 == d2 || d4 == d3
        y << d1*1_000 + d2*100 + d3*10 + d4
      end
    end
  end
end

PANDIGITAL = %w[1 2 3 4 5 6 7 8 9]
def pandigital_multiple(base)
  num = ''
  max_multiple = 0
  1.upto 9 do |multiple|
    max_multiple = multiple
    num += (base*multiple).to_s
    break if 9 <= num.length
  end
  return 0 if max_multiple < 2
  return 0 unless num.chars.sort == PANDIGITAL
  num.to_i
end

best_num = 0
best_base = nil
bases.each do |base|
  current = pandigital_multiple(base)
  if current > best_num
    best_num = current
    best_base = base
  end
end
best_base # => 9327
best_num  # => 932718654
