class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    (0...self.length-1).inject {|acc, el| self[acc].to_i ^ (self[el].to_i * el) }.hash
  end
end

class String
  def hash
    alphabet = ('a'..'z').to_a
    hash = {}
    alphabet.each_with_index do |char, i|
      hash[char] = i
    end
    word = self.split('')
    new_words = word.map {|char| hash[char]  }
    new_words.hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    arr = self.sort.flatten
    new_arr = arr.map {|el| el.hash  }
    new_arr.hash
  end
end
