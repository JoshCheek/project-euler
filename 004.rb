# https://projecteuler.net/problem=4

class Integer
  def digits
    digits, num = [], self
    while 9 < num
      digits.unshift num%10
      num /= 10
    end
    digits.unshift num
    digits
  end
end

def palindrome?(n, pair)
  digits = n.digits
  while digits.length > 1
    return false if digits.shift != digits.pop
  end
  true
end

solution = 0
max = 999
max.downto 0 do |a|
  a.downto 0 do |b|
    product = a * b
    break if product < solution
    solution = product if palindrome? product, nil
  end
end
solution # => 906609
