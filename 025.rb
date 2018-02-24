# https://projecteuler.net/problem=24

[*0..9].permutation.with_index(1) { |p, i| break p if i == 1_000_000 }.join
# => "2783915460"
