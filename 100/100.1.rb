# https://projecteuler.net/problem=100
# After a lot of optimizing, I got it down to this

def show(r, s_root)
  b = (2*r + 1 + s_root)/2
  p b: b, r: r, a: b+r
end

# calculate the first r root
a        = 10**12          # => 1000000000000
b        = a/Math.sqrt(2)  # => 707106781186.5475
r_root   = (a-b).to_i      # => 292893218812.4525
r_root  -= 1 if r_root.even?
s        = 8*r_root*r_root+1

s_root   = Math.sqrt(s).to_i
s_square = s_root*s_root


loop do
  10_000_000.times do
    if s_square < s
      s_root   += 2
      s_square += 4*s_root-4
    else
      if s_square == s
        puts "WINNING!"
        show r_root, s_root
        exit
      end
      r_root += 1
      s      += 16*r_root-8
    end
  end
  show r_root, s_root
end
