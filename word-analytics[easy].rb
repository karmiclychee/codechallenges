# Number of words
# Number of letters
# Number of symbols (any non-letter and non-digit character, excluding white spaces)
# Top three most common words (you may count "small words", such as "it" or "the")
# Top three most common letters
# Most common first word of a paragraph (paragraph being defined as a block of text with an empty line above it) (Optional bonus)
# Number of words only used once (Optional bonus)
# All letters not used in the document (Optional bonus)
# Please note that your tool does not have to be case sensitive, meaning the word "Hello" is the same as "hello" and "HELLO".

require 'pry'
require 'pry-debugger'

class RadFile < File

  def contents
    self.read
  end

  def contents_array #returns with no symbols
    workarray = contents.split(" ")
    workarray.each do |i|
      i.gsub(/[^a-zA-Z0-9]/, "")
    end
    workarray.delete("")
  end

  def symbols_array
    workarray = contents.split(" ")
    workarray.each do |i|
      i.gsub(/[a-zA-Z0-9]/, "")
    end
    workarray.delete("")
  end

  def contents_joined
    contents_array.join
  end

  def hasher(array)
    ordinator = {}
    clean_array = array.map do |item|
      item.gsub(/[^a-zA-Z0-9]/, "").downcase
    end

    clean_array.delete("")
    clean_array.map! { |item| item.to_sym }

    clean_array.each do |item|
      if ordinator[item]
        ordinator[item] += 1
      else
        ordinator[item] = 1
      end
    end
    ordinator.sort_by{ |k,v| v }.reverse
  end

#---------------------

  def wordcount
    contents_array.length
  end

  def lettercount
    contents_joined.length
  end

  def symbolcount
    symbols_array.length
  end

  def common_words
    hasher(contents_array)[0,3]
  end

  def common_letters
    hasher(contents_joined.split(""))[0,3]
  end

end


input = RadFile.new("ascii-text.txt")

puts input.common_letters
