# https://projecteuler.net/problem=39

triangles = Enumerator.new do |y|
  max = 1000
  1.upto max do |a|
    a2 = a*a
    a.upto max do |b|
      b2 = b*b
      c2 = a2 + b2
      c  = Math.sqrt(c2).to_i
      next if c*c != c2
      next if max < a+b+c
      y << [a, b, c]
    end
  end
end

p, ts = triangles.group_by { |a,b,c| a+b+c }.max_by { |p, ts| ts.length }
ts
# => [[40, 399, 401],
#     [56, 390, 394],
#     [105, 360, 375],
#     [120, 350, 370],
#     [140, 336, 364],
#     [168, 315, 357],
#     [210, 280, 350],
#     [240, 252, 348]]
p
# => 840
