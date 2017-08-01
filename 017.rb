# https://projecteuler.net/problem=17

class Integer
  def humanize
     if 1000 <= self
       "#{(self/1000).humanize} thousand #{(self%1000).humanize}"
     elsif 100 <= self
       hundred = "#{(self/100).humanize} hundred"
       rest = (self%100).humanize
       rest.length > 0 ? "#{hundred} and #{rest}" : hundred
     elsif 90 <= self
       "ninety #{(self-90).humanize}"
     elsif 80 <= self
       "eighty #{(self-80).humanize}"
     elsif 70 <= self
       "seventy #{(self-70).humanize}"
     elsif 60 <= self
       "sixty #{(self-60).humanize}"
     elsif 50 <= self
       "fifty #{(self-50).humanize}"
     elsif 40 <= self
       "forty #{(self-40).humanize}"
     elsif 30 <= self
       "thirty #{(self-30).humanize}"
     elsif 20 <= self
       "twenty #{(self-20).humanize}"
     elsif 19 == self
       'nineteen'
     elsif 18 == self
       'eighteen'
     elsif 17 == self
       'seventeen'
     elsif 16 == self
       'sixteen'
     elsif 15 == self
       'fifteen'
     elsif 14 == self
       'fourteen'
     elsif 13 == self
       'thirteen'
     elsif 12 == self
       'twelve'
     elsif 11 == self
       'eleven'
     elsif 10 == self
       'ten'
     elsif 9 == self
       'nine'
     elsif 8 == self
       'eight'
     elsif 7 == self
       'seven'
     elsif 6 == self
       'six'
     elsif 5 == self
       'five'
     elsif 4 == self
       'four'
     elsif 3 == self
       'three'
     elsif 2 == self
       'two'
     elsif 1 == self
       'one'
     elsif 0 == self
       ''
     end.strip
  end
end

342.humanize  # => "three hundred and forty two"
115.humanize  # => "one hundred and fifteen"
1000.humanize # => "one thousand"
200.humanize  # => "two hundred"
1.humanize    # => "one"
1234.humanize # => "one thousand two hundred and thirty four"
5678.humanize # => "five thousand six hundred and seventy eight"
9.humanize    # => "nine"
1.upto(1000).map(&:humanize).join.gsub(/\W/, '').length
# => 21124
