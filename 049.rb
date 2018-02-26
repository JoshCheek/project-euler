# https://projecteuler.net/problem=49
require 'prime'  # => true

Prime
  .lazy
  .drop_while { |n| n < 1_000 }
  .take_while { |n| n < 10_000 }
  .group_by { |n| n.digits.sort.join.to_i }
  .map(&:last)
  .reject { |primes| primes.length < 3 }
  .tap do |primes|
    break Enumerator.new do |y|
      primes.each do |group|
        group.combination(3)
             .each { |p1, p2, p3|
               p1, p2, p3 = [p1, p2, p3].sort
               y << [p1, p2, p3] if p3-p2 == p2-p1
             }
      end
    end
  end
  .to_a # => [[1487, 4817, 8147], [2969, 6299, 9629]]
  .last # => [2969, 6299, 9629]
  .join # => "296962999629"
  .to_i # => 296962999629
