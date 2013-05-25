c = "692 1 32".split(" ").map(&:to_i)
d = "0 0 0 14 15 123 2431".split(" ").map(&:to_i)

# if aVal is smaller than bVal[i], move bVal[i-1] back to i-2, and bVal[i-1] = aVal

c.each do |aVal|
  for i in 0...d.length do
    if aVal > d[i]
      d[i-1] = d[i] unless i-1 < 0
    else
      d[i-1] = aVal
      break
    end
  end
end

puts d.join(" ")
