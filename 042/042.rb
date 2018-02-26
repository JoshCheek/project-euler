# https://projecteuler.net/problem=42

CHAR_SCORE = [*?A..?Z].map { |c| [c, c.ord-?A.ord+1] }.to_h
def score(word)
  word.chars.map { |chr| CHAR_SCORE.fetch chr }.sum
end

require 'set'
$triangles = Set.new
$max_triangle = 0
def triangle?(num)
  while $max_triangle < num
    n = $triangles.count + 1
    $max_triangle = n*(n+1)/2
    $triangles << $max_triangle
  end
  $triangles.include? num
end

path = File.expand_path('words.txt', __dir__)
File.read(path)
    .split(',')
    .map { |w| w[1...-1] }
    .map { |w| score w }
    .select { |s| triangle? s }
    .count # => 162
