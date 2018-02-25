# https://projecteuler.net/problem=33

pairs = Enumerator.new do |y|
  10.upto 99 do |num|
    num.upto 99 do |den|
      y << [num, den]
    end
  end
end


def solution?(num, den)
  dn, dd = num.digits, den.digits
  return false if dn.any? &:zero?
  dn.reject! do |d|
    i = dd.index(d)
    dd.delete_at i if i
    i
  end
  new_num = dn.join.reverse.to_i
  new_den = dd.join.reverse.to_i
  return false if new_den.zero?
  return false if new_num == num
  correct   = num.to_r / den
  incorrect = new_num.to_r / new_den
  incorrect == correct
end


solutions = Enumerator.new do |y|
  pairs.each do |num, den|
    y << [num, den] if solution? num, den
  end
end


solutions              # => #<Enumerator: #<Enumerator::Generator:0x00007fb44b812110>:each>
  .to_a                # => [[16, 64], [19, 95], [26, 65], [49, 98]]
  .transpose           # => [[16, 19, 26, 49], [64, 95, 65, 98]]
  .map { |nums|
    nums               # => [16, 19, 26, 49], [64, 95, 65, 98]
      .reduce(1, :*)   # => 387296,           38729600
      .to_r            # => (387296/1),       (38729600/1)
  }
  .tap { |num, den|
    frac = num / den   # => (1/100)
    frac.denominator   # => 100
  }
