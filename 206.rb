# https://projecteuler.net/problem=206
# p Math.sqrt(1020304050607080900).to_i.step.find { |root| (root**2).to_s =~ /1.2.3.4.5.6.7.8.9.0/ }
# =>

def solution?(potential)
  d = potential.digits
  d[0] == 0 && d[2] == 9 && d[4] == 8 && d[6] == 7 && d[8] == 6 && d[10] == 5 && d[12] == 4 && d[14] == 3 && d[16] == 2 && d[18] == 1
end

start = Math.sqrt(1020304050607080900).ceil
start += (10 - (start%10)) unless start % 10 == 0
soln = start.step by: 10 do |root|
  square = root**2
  break root if solution? square
end
soln  # => 1389019170
