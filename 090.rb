# https://projecteuler.net/problem=90
def covers_all_squares?(d1, d2)
  return false unless d1.include?(0) && d2.include?(1) || d1.include?(1) && d2.include?(0)
  return false unless d1.include?(0) && d2.include?(4) || d1.include?(4) && d2.include?(0)
  return false unless d1.include?(0) && d2.include?(9) || d1.include?(9) && d2.include?(0)
  return false unless d1.include?(1) && d2.include?(6) || d1.include?(6) && d2.include?(1)
  return false unless d1.include?(2) && d2.include?(5) || d1.include?(5) && d2.include?(2)
  return false unless d1.include?(3) && d2.include?(6) || d1.include?(6) && d2.include?(3)
  return false unless d1.include?(4) && d2.include?(9) || d1.include?(9) && d2.include?(4)
  return false unless d1.include?(1) && d2.include?(8) || d1.include?(8) && d2.include?(1)
  return true
end

all_dice = [*0..9].combination(6).map do |die|
  die << 6 if die.include? 9
  die << 9 if die.include? 6
  die
end

all_dice
  .flat_map { |d1| all_dice.zip [d1].cycle }
  .map(&:sort)
  .uniq
  .count { |d1, d2| covers_all_squares? d1, d2 }
  # => 1217
