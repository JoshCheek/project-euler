# https://projecteuler.net/problem=37
require 'prime'

def truncatable?(p)
  digits = p.digits.reverse
  digits.length.pred.times.all? do |i|
    digits[i+1..-1].join.to_i.prime? &&
      digits[0...-i-1].join.to_i.prime?
  end
end


Prime.lazy
     .drop_while { |p| p < 10 }
     .select     { |p| truncatable? p }
     .take(11)  # => #<Enumerator::Lazy: #<Enumerator::Lazy: #<Enumerator::Lazy: #<Enumerator::Lazy: Prime>:drop_while>:select>:take(11)>
     .to_a      # => [23, 37, 53, 73, 313, 317, 373, 797, 3137, 3797, 739397]
     .sum       # => 748317
