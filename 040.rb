# https://projecteuler.net/problem=40

digits = Enumerator.new do |y|
  0.step do |i|
    i.digits.reverse.each do |d|
      y << d
    end
  end
end

digits.take(1_000_000+1).select.with_index { |d, i|
  i == 1 || i == 10 || i == 100 || i == 1_000 ||
  i == 10_000 || i == 100_000 || i == 1_000_000
}              # => [1, 1, 5, 3, 7, 2, 1]
.reduce(1, :*) # => 210
