# https://projecteuler.net/problem=101
require 'matrix'
f = -> n { n**3 }
f = -> n { 1 - n + n**2 - n**3 + n**4 - n**5 + n**6 - n**7 + n**8 - n**9 + n**10 }

1.step.lazy.map do |k|
  powers, values = [], []
  1.upto k do |y|
    powers << k.pred.downto(0).map { |x| y**x }
    values << [f[y]]
  end
  coefficients = Matrix[*powers].inverse * Matrix[*values]
  predicted    = coefficients.to_a.reverse.map.with_index { |(c), i| c * (k+1)**i }.sum

  if predicted == f[k+1]
    nil
  else
    predicted
  end
end.take_while(&:itself).sum.to_i # => 37076114526
