# https://projecteuler.net/problem=68

#      a
#       \
#       _ f    b
#     j    \  /
#   /|       g
# e  |      /
#     i - h - c
#      \
#       d

10.downto 1 do |a|
  10.downto 1 do |b|
  next if b <= a
  10.downto 1 do |c|
  next if c <= a
  next if b == c
  10.downto 1 do |d|
  next if d <= a
  next if b == d || c == d
  10.downto 1 do |e|
  next if e <= a
  next if b == e || c == e || d == e

    10.downto 1 do |f|
    next if a == f || b == f || c == f || d == f || e == f
    10.downto 1 do |g|
    next if a == g || b == g || c == g || d == g || e == g || f == g
    sum = a+f+g
    next if sum < e+f
    next if sum <= b+g
    10.downto 1 do |h|
    next if a == h || b == h || c == h || d == h || e == h || f == h || g == h
    next unless sum == b+g+h
    next if sum <= c+h
    10.downto 1 do |i|
    next if a == i || b == i || c == i || d == i || e == i || f == i || g == i || h == i
    next unless sum == c+h+i
    next if sum < d+i
    10.downto 1 do |j|
    next if a == j || b == j || c == j || d == j || e == j || f == j || g == j || h == j || i == j
    next unless sum == d+i+j
    next unless sum == e+j+f

      soln = [
        [a,f,g],
        [b,g,h],
        [c,h,i],
        [d,i,j],
        [e,j,f],
      ]
      # => [[6, 5, 3], [10, 3, 1], [9, 1, 4], [8, 4, 2], [7, 2, 5]]

      soln.map(&:sum)  # => [14, 14, 14, 14, 14]
      soln.join        # => "6531031914842725"
      exit

    end
    end
    end
    end
    end


  end
  end
  end
  end
end
