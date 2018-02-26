# https://projecteuler.net/problem=48
1.upto(1000).map { |n| n**n }.sum.to_s[-10..-1].to_i
# => 9110846700
