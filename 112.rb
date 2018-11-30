# https://projecteuler.net/problem=112
def bouncy?(n)
  decreasing = false
  increasing = false
  n.digits.each_cons(2) do |n1, n2|
    if n1 < n2
      increasing = true
      return true if decreasing
    elsif n1 > n2
      decreasing = true
      return true if increasing
    end
  end
  false
end


is_bouncy = 0
1.step do |n|
  is_bouncy += 1 if bouncy? n
  if is_bouncy.to_f / n == 0.99
    p n  # => 1587000
    break
  end
end
