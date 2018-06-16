# https://projecteuler.net/problem=79
# https://projecteuler.net/project/resources/p079_keylog.txt

def match?(haystack, needle)
  needle = needle.dup
  haystack.each do |h|
    next unless h == needle.first
    needle.shift
    return true if needle.empty?
  end
  false
end


def count_down(digits=1, &block)
  if digits == 1
    9.downto(0) { |i| block.call [i] }
  else
    9.downto(0) { |i|
      count_down(digits-1) { |rest| block.call [i, *rest] }
    }
  end
end

def count_up(&block)
  1.step { |i| count_down(i, &block) }
end

logged = File.readlines(File.expand_path('p079_keylog.txt', __dir__))
             .map { |line| line.chomp.to_i.digits }

i = 0
code = count_up do |code_digits|
  i += 1
  p code_digits if i % 100_000 == 0
  break code_digits if logged.all? { |logged_digits| match? code_digits, logged_digits }
end

require "pry"
binding().pry
