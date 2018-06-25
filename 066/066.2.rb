def ystream(d)
  Enumerator.new do |y|
    xsq = 1
    1.step do |i|
      xsq += d*(2*i-1)
      y << xsq
    end
  end
end
def xstream
  Enumerator.new do |y|
    memo = 0
    1.step do |i|
      memo += 2*i-1
      y << memo
    end
  end
end

# {:x=>3, :d=>2, :y=>2}
# {:x=>9, :d=>5, :y=>4}
# {:x=>19, :d=>10, :y=>6}
# {:x=>649, :d=>13, :y=>180}
# {:x=>9801, :d=>29, :y=>1820}
# {:x=>24335, :d=>46, :y=>3588}
# {:x=>66249, :d=>53, :y=>9100}

def square?(n)
  root = Math.sqrt(n).to_i
  root*root == n
end

best = nil
2.upto 1000 do |d|
  next if square? d
  ys = ystream(d)
  xs = xstream()
  loop do
    xsq1 = ys.peek
    xsq2 = xs.peek
    if xsq1 < xsq2
      ys.next
    elsif xsq1 > xsq2
      xs.next
    else
      break
    end
  end
  crnt = {d: d, xsq: xs.peek}
  best = crnt if !best || best[:xsq] < crnt[:xsq]
  p d => crnt
end
