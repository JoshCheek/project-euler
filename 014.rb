# https://projecteuler.net/problem=14

chains = {0 => 0, 1 => 1}

chain = -> i do
  chains[i] ||= 1 + chain[i.even? ? i/2 : i*3+1]
end

2.upto(1_000_000) { |crnt| chain[crnt] }

soln, soln_len = chains.max_by do |num, length|
  next -1 if 1_000_000 <= num
  length
end

soln     # => 837799
soln_len # => 525
