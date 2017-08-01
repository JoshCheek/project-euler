# https://projecteuler.net/problem=9
1.step do |c|
  c2 = c*c
  1.upto c-1 do |b|
    b2 = b*b
    c2_minus_b2 = c2 - b2
    1.upto b-1 do |a|
      next unless a*a == c2_minus_b2
      sum = a+b+c
      break if sum > 1000
      next unless a+b+c == 1000
      p a: a, b: b, c: c
      p a*b*c
      exit
    end
  end
end

# >> {:a=>200, :b=>375, :c=>425}
# >> 31875000
