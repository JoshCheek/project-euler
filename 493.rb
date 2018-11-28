# https://projecteuler.net/problem=493
num_colors = 0r
seen = 0r
new  = 70r

# turn 1
20.times do
  total            = seen + new
  probability_seen = seen / total
  probability_new  = new  / total
  num_colors += probability_new
  seen -= probability_seen
  new  -= probability_new
  seen += probability_new * 9
  new  -= probability_new * 9
end

def show(rational)
  "%1.9f" % rational
end

new.to_f        # => 1.812581979802384
seen.to_f       # => 48.18741802019762
num_colors.to_f # => 6.818741802019762

show num_colors # => "6.818741802"
