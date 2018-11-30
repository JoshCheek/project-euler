# https://projecteuler.net/problem=73
d         = 12_000
half      = 1.0/2
third     = 1.0/3
solutions = {}
1.upto(d).each do |denominator|
  denominator = denominator.to_f
  lower       = (denominator.to_f/3).ceil
  upper       = (denominator.to_f/2).floor
  lower.upto(upper)
       .map { |numerator| numerator.to_f / denominator }
       .reject { |num| num == half || num == third}
       .each { |solution| solutions[solution] = true }
end
solutions.size # => 7295372
