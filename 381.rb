def align(keyed_vals, keys)
  Enumerator.new do |y|
    begin
      val_key, val = keyed_vals.next
      key = keys.next
      loop do
        if val_key < key
          val_key, val = keyed_vals.next
        elsif key < val_key
          key = keys.next
        else
          y << [val_key, val]
          key = keys.next
        end
      end
    rescue StopIteration
    end
  end
end


bound = 100

enum = Enumerator.new do |y|
  i    = 4
  fact = 6
  sum  = 10
  nums = [0, 1, 1, 2, 6]
  loop do
    fact *= i
    i    += 1
    break if bound <= i
    sum  += fact
    sum  -= nums.shift
    nums << fact
    y << [i, sum % i]
  end
end

require 'prime'
align(enum, Prime.each).map(&:last).sum # => 480
