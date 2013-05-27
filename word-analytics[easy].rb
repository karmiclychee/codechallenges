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

class RadFile

  def initialize(file)
    @contents = File.new(file).read
  end

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
    hasher(contents_array).sort_by{ |k,v| v }.reverse[0,3]
  end

  def single_use_words
    counter = 0
    hasher(contents_array).each do | k, v |
      if v == 1
        counter += 1
      end
    end
    counter
  end

  def paragraph_firsts
    firsts = []
    paragraph_array.each do |array|
      firsts << array.first
    end
    firsts.join("\n")
  end

  def common_letters
    hasher(contents_joined.split("")).sort_by{ |k,v| v }.reverse[0,3]
  end

  def all_letters
    letters = []
    hasher(contents_joined.split("")).each do | k, v |
      letters << k
    end
    letters.sort.join(" ")
  end

  #--------------------

  def contents
    @contents
  end

  def paragraph_array
    paragraph = array_maker(/[^a-zA-Z0-9]/, "\n")
    paragraph.map! do |string|
      string.split(" ")
    end
    paragraph
  end

  def contents_array #returns with no symbols
    array_maker(/[^a-zA-Z0-9]/, " ")
  end

  def symbols_array #returns only symbols
    array_maker(/[a-zA-Z0-9]/, " ")
  end

  def contents_joined
    contents_array.join
  end

  def array_maker(regexp, split) #takes a regexp to clean the array
    text = self.contents.split(split)
    text.each do |i|
      i.gsub(regexp, "")
    end
    text.delete("")
    text
  end

  def hasher(array) # returns a hash of counted items
    ordinator = {}
    clean_array = array.map do |item|
      item.gsub(/[^a-zA-Z0-9]/, "").downcase
    end

    clean_array.delete("")
    clean_array.map! { |item| item }

    clean_array.each do |item|
      if ordinator[item]
        ordinator[item] += 1
      else
        ordinator[item] = 1
      end
    end
    ordinator
  end
end

input = RadFile.new("ascii-text.txt")
puts "#{input.wordcount} words
#{input.lettercount} letters
#{input.symbolcount} symbols
Top three most common words: #{input.common_words}
Top three most common letters: #{input.common_letters}
First words of each paragraph: #{input.paragraph_firsts}
Number of words only used once: #{input.single_use_words}
Letters used: #{input.all_letters}"
