# https://projecteuler.net/problem=63
def size_of(n)
  size = 0
  until n.zero?
    size += 1
    n /= 10
  end
  size
end

def compare(n, exponent)
  size_of(n ** exponent) <=> exponent
end

def solve_for(exponent)
  i = 1
  solutions = []
  loop do
    result = compare(i, exponent)
    break if 0 < result
    solutions << i if result.zero?
    i += 1
  end
  solutions
end

solutions = {}
1.step do |i|
  crnt_solutions = solve_for i
  break if crnt_solutions.empty?
  solutions[i] = crnt_solutions
end
solutions
# => {1=>[1, 2, 3, 4, 5, 6, 7, 8, 9],
#     2=>[4, 5, 6, 7, 8, 9],
#     3=>[5, 6, 7, 8, 9],
#     4=>[6, 7, 8, 9],
#     5=>[7, 8, 9],
#     6=>[7, 8, 9],
#     7=>[8, 9],
#     8=>[8, 9],
#     9=>[8, 9],
#     10=>[8, 9],
#     11=>[9],
#     12=>[9],
#     13=>[9],
#     14=>[9],
#     15=>[9],
#     16=>[9],
#     17=>[9],
#     18=>[9],
#     19=>[9],
#     20=>[9],
#     21=>[9]}

solutions.values.flatten.size # => 49
