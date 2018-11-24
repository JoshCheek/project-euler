# https://projecteuler.net/problem=121

def probabilities(turns, red:, blue:)
  likelihood = blue.to_r / (blue+red)
  return [[1, likelihood], [0, 1-likelihood]] if turns == 1
  probabilities(turns-1, red: red+1, blue: blue)
    .group_by { |blue_count, blue_prob| blue_count }
    .transform_values { |probs| probs.map(&:last).reduce(0, :+) }
    .flat_map { |blue_count, blue_prob|
      [ [blue_count+1, blue_prob*likelihood],
        [blue_count,   blue_prob*(1-likelihood)]
      ]
    }
end

def payout(turns)
  win_probability = probabilities(turns, red: 1, blue: 1)
    .select { |count, probability| count > (turns-count) }
    .map(&:last)
    .sum
  (1/win_probability).to_i
end

payout 4  # => 10
payout 15 # => 2269
