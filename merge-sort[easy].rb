# # http://www.reddit.com/r/dailyprogrammer/comments/1epasu/052013_challenge_126_easy_realworld_merge_sort/

# Input Description
# You will be given two lists, list A and B, of integers from 1
# to 2147483647. List A will be unsorted, while list B will be sorted. List B has
# extra elements in the start of the list that are all '0' value: this is buffered
# space for you to work with when merging and sorting list A into B. These two
# lists will be space-delimited and on separate lines.

# Output Description
# Simply print the contents of list B, after it has had the contents of A merged & sorted
# within it.

# Sample Inputs & Outputs

# Sample Input
# 692 1 32
# 0 0 0 14 15 123 2431

# Sample Output
# 1 14 15 32 123 692 2431

a = "692 1 32".split(" ").map(&:to_i)
b = "0 0 0 14 15 123 2431".split(" ").map(&:to_i)

a.each do |aVal|
  for i in 0...b.length do
    if aVal > b[i]
      b[i-1] = b[i] unless i-1 < 0
    else
      b[i-1] = aVal
      break
    end
  end
end

puts b.join(" ")
