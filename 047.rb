# https://projecteuler.net/problem=47
require 'prime'

def nums_for(num_divisors)
  Enumerator.new do |y|
    1.step do |n|
      y << n if n.prime_division.length == num_divisors
    end
  end
end

nums_for(2).lazy.each_cons(2).select { |a, b| a+1 == b }
  .first # => [14, 15]

nums_for(3).lazy.each_cons(3).select { |a, b, c| a+1 == b && b+1 == c }
  .first # => [644, 645, 646]

nums_for(4).lazy.each_cons(4).select { |a, b, c, d| a+1 == b && b+1 == c && c+1 == d }
  .first # => [134043, 134044, 134045, 134046]
  .first # => 134043
