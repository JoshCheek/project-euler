# Translated 066.2 into simpler Ruby so I could run it with crystal.
# Definitely much faster, but in the end,
# I had to learn more math in order to improve the algorithm.
# Even in Crystal, this would have run for days >.<
# You can run quickly(ish) like this (good for experimenting)
#     $ crystal run 066.3.cr
#
# You can compile with all the optimizations like this
# (good for when you like what you've got and want to run for realsies)
#     $ crystal build 066.3.cr -o 066 --release
#     $ ./066
def square?(n)
  root = Math.sqrt(n).to_i
  root*root == n
end

best = nil
2.upto 1000 do |d|
  next if square? d
  xsq1, i1 = 1+d, 2
  xsq2, i2 = 1,   2
  start = Time.now
  loop do
    if xsq1 < xsq2
      xsq1 += d*(2*i1-1)
      i1   += 1
    elsif xsq1 > xsq2
      xsq2 += 2*i2-1
      i2 += 1
    else
      break
    end
  end
  stop = Time.now
  crnt = {d: d, xsq: xsq1}
  best = crnt if !best || best[:xsq] < crnt[:xsq]
  puts [d, xsq1, best[:d], best[:xsq], stop-start].inspect
end
