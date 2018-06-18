# https://projecteuler.net/problem=59
path     = File.expand_path 'p059_cipher.txt', __dir__
ordinals = File.read(path).split(?,).map(&:to_i)
chars    = [*?a..?z].map(&:ord)

chars.each do |ap|
  chars.each do |bp|
    chars.each do |cp|
      decrypted =
        ordinals
          .each_slice(3)
          .flat_map { |os|
            os.zip([ap, bp, cp]).map { |o, p| o^p }
          }
          .map(&:chr)
          .join
      # https://en.wikipedia.org/wiki/Most_common_words_in_English#100_most_common_words
      next unless decrypted[/\bthe\b/]
      next unless decrypted[/\bto\b/]
      next unless decrypted[/\bof\b/]
      decrypted.chars.map(&:ord).sum  # => 107359
      exit
    end
  end
end
