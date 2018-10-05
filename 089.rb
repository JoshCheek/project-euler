# https://projecteuler.net/problem=89
#
# Important rules:
# https://projecteuler.net/about=roman_numerals

VALUES = {
  'M'  => 1000,
  'CM' => 900,
  'D'  => 500,
  'CD' => 400,
  'C'  => 100,
  'XC' => 90,
  'L'  => 50,
  'XL' => 40,
  'X'  => 10,
  "IX" => 9,
  'V'  => 5,
  'IV' => 4,
  'I'  => 1,
}

def to_roman(n)
  roman = ''
  VALUES.each do |char, value|
    while value <= n
      n -= value
      roman << char
    end
  end
  roman
end

def from_roman(roman)
  n = 0
  until roman.empty?
    VALUES.each do |str, sum|
      next unless roman.start_with? str
      n += sum
      roman = roman[str.size..-1]
      break
    end
  end
  n
end

def minify(num)
  to_roman from_roman num
end


if true
  File.foreach('/Users/josh/code/project-euler/data/089-roman-numerals')
      .map(&:chomp)
      .map { |roman| roman.size - minify(roman).size }
      .sum  # => 743
else
  RSpec.describe 'from_roman' do
    def self.test_roman(roman, decimal)
      name = sprintf "%2s = %2d", roman, decimal
      example(name) { expect(from_roman roman).to eq  decimal }
    end
    test_roman 'I',      1
    test_roman 'II',     2
    test_roman 'III',    3
    test_roman 'IV',     4
    test_roman 'IIII',   4
    test_roman 'V',      5
    test_roman 'VI',     6
    test_roman 'VII',    7
    test_roman 'VIII',   8
    test_roman 'VIIII',  9
    test_roman 'IX',     9
    test_roman 'X',      10
    test_roman 'XI',     11
    test_roman 'XVIIII', 19
    test_roman 'XIV',    14
    test_roman 'XVI',    16

    test_roman 'XX',     20
    test_roman 'XXX',    30
    test_roman 'XL',     40
    test_roman 'XLIV',   44
    test_roman 'XLIX',   49
    test_roman 'L',      50
    test_roman 'LXVI',   66

    test_roman 'XC',     90
    test_roman 'XCV',    95
    test_roman 'XCVI',   96
    test_roman 'XCIX',   99
    test_roman 'LXXXXVIIII', 99
    test_roman 'C',      100
    test_roman 'D',      500
    test_roman 'CD',     400
    test_roman 'CM',     900
    test_roman 'CMI',    901
    test_roman 'M',      1000
  end

  RSpec.describe 'to_roman' do
    def self.test_roman(roman, decimal)
      name = sprintf "%2s = %2d", roman, decimal
      example(name) { expect(to_roman decimal).to eq roman }
    end
    test_roman 'I',      1
    test_roman 'II',     2
    test_roman 'III',    3
    test_roman 'IV',     4
    test_roman 'V',      5
    test_roman 'VI',     6
    test_roman 'VII',    7
    test_roman 'VIII',   8
    test_roman 'IX',     9
    test_roman 'X',      10
    test_roman 'XI',     11
    test_roman 'XIV',    14
    test_roman 'XVI',    16
    test_roman 'XIX',    19

    test_roman 'XX',     20
    test_roman 'XXX',    30
    test_roman 'XL',     40
    test_roman 'XLIV',   44
    test_roman 'XLIX',   49
    test_roman 'L',      50
    test_roman 'LXVI',   66

    test_roman 'XC',     90
    test_roman 'XCV',    95
    test_roman 'XCVI',   96
    test_roman 'XCIX',   99
    test_roman 'C',      100
    test_roman 'D',      500
    test_roman 'CD',     400
    test_roman 'CM',     900
    test_roman 'CMI',    901
    test_roman 'M',      1000
  end
end
