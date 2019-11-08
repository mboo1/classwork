class Array

  def my_uniq
    i = 0
    answer = []
    while i < self.length
      if !answer.include?(self[i])
        answer << self[i]
      end
      i += 1
    end
    answer
  end

  def two_sum
    result = []
    (0...self.length).each do |i|
      (0...self.length).each do |j|
        if self[i] + self[j] == 0 && j > i
          result << [i,j]
        end
      end
    end
    return result 
  end

  def my_transpose
    results = []
    (0...self.length).each do |i|
      new_row = []
      self.each do |row|
        new_row << row[i]
      end
      results << new_row
    end
    return results
  end

end

def stock_picker(arr)
  raise ArgumentError if !arr.is_a?(Array)
  best_days = nil
  best_value = 0
  (0...arr.length-1).each do |i|
    (i+1...arr.length).each do |j|
      if arr[j] - arr[i] > best_value
        best_days = [i,j]
        best_value = arr[j]-arr[i]
      end
    end
  end
  best_days
end

class TowersOfHanoi
  
  def initialize(board = [[1,2,3,4,5],[],[]])
    @board = board
  end

    # if first[0] > second[0]
    # if first.nil?
    # 
  def move(coords)
    first, second = coords
    if @board[first] == []
      return @board
    elsif first > 2 || second > 2 || first < 0 || second < 0
      return @board
    elsif @board[first][0] > @board[second][0]
      return @board
    end
    @board[second].unshift(@board[first].shift)
    return @board
  end
end