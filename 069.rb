# https://projecteuler.net/problem=69
require 'prime'
Prime.reduce(1) { |n, p| n*p < 1_000_000 ? n*p : (break n) } # => 510510
