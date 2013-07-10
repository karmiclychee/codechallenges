# Given a well-formed (non-empty, fully valid) string of digits, let the integer
# N be the sum of digits. Then, given this integer N, turn it into a string of
# digits. Repeat this process until you only have one digit left. Simple, clean,
# and easy: focus on writing this as cleanly as possible in your preferred
# programming language.

class NumberCruncher

  def initialize(input)
    @initial_string = input
  end

  def crunch(working=@initial_string)
    p working = working.to_s
    sum = working.split('').map(&:to_i).inject(:+)
    sum <= 9 ? p(sum.to_s) : crunch(sum)
  end

end

NumberCruncher.new(ARGV.first).crunch
