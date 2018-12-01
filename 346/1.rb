# https://projecteuler.net/problem=346
# seems like it probably works, but it's going to take ~ 2_000_000_000_000 operations, which I think will be very slow
def to_i num_digits, base
  num_digits.times.sum { |e| base ** e }
end

target     = 1_000
repunits   = Hash.new { |h, k| h[k] = 0 }
operations = 0
1.step do |num_digits|
  break if target < to_i(num_digits, 2)
  2.upto(target) do |base|
    repval = to_i num_digits, base
    break if repval > target
    repunits[repval] += 1
    operations += 1
  end
end

operations # => 2044

repunits.reject { |k, vs| k > target || vs < 2 }.sum(&:first) # => 15864
