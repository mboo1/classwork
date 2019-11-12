class MaxIntSet
  attr_reader :store

  def initialize(max)
    @store = Array.new(max, false)
  end

  def insert(num)
    # raise 'Out of bounds' if num >= @store.length || num < 0
    if is_valid?(num)
       @store[num] = true
    else
      raise 'Out of bounds'
    end
  end

  def remove(num)
    @store[num] = false if is_valid?(num)
    # raise ArgumentError
  end

  def include?(num)
    @store[num] if is_valid?(num)
    # raise ArgumentError
  end

  private

  def is_valid?(num)
    return false if !num.is_a?(Integer) || num < 0 || num >= @store.length
    true
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    self[num] << num
  end

  def remove(num)
    self[num].delete(num)
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    @store[num % num_buckets]
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  # attr_reader :count
  attr_accessor :store, :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    if !self[num].include?(num)
      self[num] << num
      @count += 1
      #check size
      resize! if @count >= num_buckets 
    end
  end

  def remove(num)
    if self[num].include?(num)
      self[num].delete(num)
      @count -= 1
    end
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    new_array = Array.new (num_buckets * 2) {Array.new}
    @store.each do |bucket|
      bucket.each do |ele|
        new_array[ele % (num_buckets * 2)] << ele
      end
    end
    @store = new_array
  end
end
