# https://projecteuler.net/problem=346
# seems like it probably works, but it's going to take a while to run,
# so do it later when I'm plugged into a power outlet
target     = 1_000_000_000_000_u64
# target     = 10_000_000_u64
# target     = 1000_u64
repunits   = Hash(UInt64, UInt32).new 0
operations = 0_u64
count      = 1
2_u64.upto(target) do |base|
  p base: base if base % 100_000 == 0
  repval = 0_u64
  2_u64.step do |num_digits|
    repval *= base
    repval += 1_u64
    break if repval > target
    repunits[repval] += 1
    operations += 1
  end
  count += base if 1 < repunits[base]
  repunits.delete base
end

p operations: operations, # => 2044
  count: count # => 15864
