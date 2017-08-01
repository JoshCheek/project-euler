# https://projecteuler.net/problem=7
require 'prime'

Prime.each.with_index(1) { |prime, index| break prime if index == 10001 }
# => 104743
