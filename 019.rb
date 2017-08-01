# https://projecteuler.net/problem=19

require 'active_support/time'
(Date.parse('1 Jan 1901')..Date.parse('31 Dec 2000')) # => Tue, 01 Jan 1901..Sun, 31 Dec 2000
  .select(&:sunday?)
  .select { |date| date.day == 1 }
  .count # => 171
