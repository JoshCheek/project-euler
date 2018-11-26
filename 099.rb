# https://projecteuler.net/problem=101
Dir.chdir __dir__

def mult(base, exp)
  return [0, 1.0] if exp.zero?
  if exp.odd?
    magnitude, significant = mult(base, exp-1)
    significant *= base
  else
    magnitude, significant = mult(base, exp/2)
    magnitude    *= 2
    significant **= 2
  end
  while significant > 10
    significant /= 10
    magnitude += 1
  end
  [magnitude, significant]
end

File.readlines('data/099-largest-exponential')
    .map.with_index(1) { |line, index| # IMPORTANT!!!!!!! I got this wrong 10 time b/c it counts from 1, and not 0
      magnitude, significant = mult *line.split(',').map(&:to_i)
      [magnitude, significant, index]
    }
    .sort
    .last  # => [3005315, 7.6420732648176415, 709]
