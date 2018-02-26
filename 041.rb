# https://projecteuler.net/problem=41
require 'prime'
[*1..9].permutation.map { |d| d.join.to_i }.select(&:prime?).max # => nil
[*1..8].permutation.map { |d| d.join.to_i }.select(&:prime?).max # => nil
[*1..7].permutation.map { |d| d.join.to_i }.select(&:prime?).max # => 7652413
