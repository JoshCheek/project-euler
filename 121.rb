# https://projecteuler.net/problem=121
#
# WTF? I'm consistently getting ~11/100, not 11/120
# and the banker is consistently losing money!

def win?(n)
  hist = []
  bag  = [:red, :blue]
  n.times do
    hist << bag.sample
    bag = bag.push(:red).shuffle.take(2)
  end
  hist.count { |disc| disc == :blue } > hist.count { |disc| disc == :red }
end


play_count = 10_000
win_count  = 0
money      = 0
play_count.times do
  money += 1
  if win? 4
    money     -= 10
    win_count += 1
  end
end

money                       # => -1110
win_count.to_f / play_count # => 0.1111
11.0           / 120        # => 0.09166666666666666

