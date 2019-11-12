# require 'byebug'
class HashSet
  # attr_reader :count
  attr_accessor :store, :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    index = key.hash
    # debugger
    if !self.include?(key)
      self[index] << key
      @count += 1
      resize! if @count >= num_buckets
    end
  end

  def include?(key)
    self[key.hash].include?(key)
  end

  def remove(key)
    index = key.hash
    if self[index].include?(key)
      self[index].delete(key)
      @count -= 1
    end
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
    new_arr = Array.new(num_buckets * 2) {Array.new}
    @store.each do |arr|
      arr.each do |el|
        index = el.hash
        new_arr[index % (num_buckets * 2)] << el
      end
    end
    @store = new_arr
  end
end
