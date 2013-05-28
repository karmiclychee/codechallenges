# As a crude form of hashing function, Lars wants to sum the digits of a number.
# Then he wants to sum the digits of the result, and repeat until he have only one
# digit left. He learnt that this is called the digital root of a number, but the
# Wikipedia article is just confusing him. Can you help him implement this problem
# in your favourite programming language? It is possible to treat the number as a
# string and work with each character at a time. This is pretty slow on big
# numbers, though, so Lars wants you to at least try solving it with only integer
# calculations (the modulo operator may prove to be useful!).

class DigitsSum

  def initialize(integer)
    @integer = integer
  end

  def integer
    self.looper
  end

  def looper
    open = true
    while open == true
      @integer = input(@integer)
      if @integer.to_s.split("").length > 1
        @integer = input(@integer)
      else
        open = false
      end
    end
    @integer
  end

  def input(integer)
    workarray = integer.to_s.split("")
    workarray.map! { |x| x.to_i }
    for i in 1...workarray.length do
      workarray[0] = workarray[0] + workarray[i]
    end
    workarray[0]
  end

end

roygbiv = DigitsSum.new(11)
puts roygbiv.integer
