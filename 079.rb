# https://projecteuler.net/problem=65

E = [2]
1.upto(100) { |k| E << 1 << 2*k << 1 }

def e(n)
  return E[0].to_r if n < 1
  E[0] + 1r/e2(1, n)
end

def e2(crnt, stop)
  return E[crnt] if crnt == stop
  E[crnt] + 1r/e2(crnt+1, stop)
end

e(99).numerator.digits.sum # => 272
