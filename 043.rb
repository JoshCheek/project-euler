# https://projecteuler.net/problem=43

Enumerator.new do |y|
  1.upto 9 do |d1|
    0.upto 9 do |d2|
      next if d2 == d1
      0.upto 9 do |d3|
        next if d3 == d1 || d3 == d2
        0.upto 9 do |d4|
          next if d4 == d1 || d4 == d2 || d4 == d3
          next if [d2, d3, d4].join.to_i % 2 != 0
          0.upto 9 do |d5|
            next if d5 == d1 || d5 == d2 || d5 == d3 || d5 == d4
            next if [d3, d4, d5].join.to_i % 3 != 0
            0.upto 9 do |d6|
              next if d6 == d1 || d6 == d2 || d6 == d3 || d6 == d4 || d6 == d5
              next if [d4, d5, d6].join.to_i % 5 != 0
              0.upto 9 do |d7|
                next if d7 == d1 || d7 == d2 || d7 == d3 || d7 == d4 || d7 == d5 || d7 == d6
                next if [d5, d6, d7].join.to_i % 7 != 0
                0.upto 9 do |d8|
                  next if d8 == d1 || d8 == d2 || d8 == d3 || d8 == d4 || d8 == d5 || d8 == d6 || d8 == d7
                  next if [d6, d7, d8].join.to_i % 11 != 0
                  0.upto 9 do |d9|
                    next if d9 == d1 || d9 == d2 || d9 == d3 || d9 == d4 || d9 == d5 || d9 == d6 || d9 == d7 || d9 == d8
                    next if [d7, d8, d9].join.to_i % 13 != 0
                    0.upto 9 do |d10|
                      next if d10 == d1 || d10 == d2 || d10 == d3 || d10 == d4 || d10 == d5 || d10 == d6 || d10 == d7 || d10 == d8 || d10 == d9
                      next if [d8, d9, d10].join.to_i % 17 != 0
                      y << [d1,d2,d3,d4,d5,d6,d7,d8,d9,d10].join.to_i
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end
.to_a # => [1406357289, 1430952867, 1460357289, 4106357289, 4130952867, 4160357289]
.sum  # => 16695334890
