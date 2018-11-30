# https://projecteuler.net/problem=205
peter = { 0 => 1r }
9.times do
  succ = Hash.new 0
  peter.map do |value, probability|
    succ[value+1] += probability/4
    succ[value+2] += probability/4
    succ[value+3] += probability/4
    succ[value+4] += probability/4
  end
  peter = succ
end

colin = { 0 => 1r }
6.times do
  succ = Hash.new 0
  colin.map do |value, probability|
    succ[value+1] += probability/6
    succ[value+2] += probability/6
    succ[value+3] += probability/6
    succ[value+4] += probability/6
    succ[value+5] += probability/6
    succ[value+6] += probability/6
  end
  colin = succ
end

prob_pete_wins = peter.flat_map do |pete_roll, pete_prob|
  colin.select do |colin_roll, _|
    pete_roll > colin_roll
  end.map { |_, colin_prob| pete_prob * colin_prob }
end.sum

"%1.7f" % prob_pete_wins # => "0.5731441"
