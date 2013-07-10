# m(n)
#   if n > 100
#     return n - 10
#   else
#     m(n + 11)
#   end


def m(n)
  if n > 100
    puts "M(#{n-10}) since 110 is greater than 100"
    n - 10
  else
    puts "M(M(#{n+11})) since #{n} is equal to or less than 100"
    m(m(n + 11))
  end
end

def mccarthy(n)
  puts "M(#{n})"
  puts "#{m(n)} since #{m(n)+10} is greater than 100"
end

puts mccarthy(1)
