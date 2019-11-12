require 'byebug'

class Node
  attr_reader :key
  attr_accessor :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
    # debugger
    @next.prev = @prev
    @prev.next = @next
  end
end

class LinkedList
  include Enumerable

  # attr_accessor :last

  def initialize
    @head = Node.new()
    @tail = Node.new()
    @head.next = @tail
    @tail.prev = @head
    # @list = [@head, @tail]
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    return true if @head.next == @tail
    false
  end

  def get(key)
    self.each do |node|
      return node.val if node.key == key
    end
    
  end

  def include?(key)
    self.each do |node|
      return true if node.key == key
    end
    false
  end

  def append(key, val)
    node = Node.new(key, val)
    #set last's next to
    node.prev = @tail.prev
    node.next = @tail
    @tail.prev.next = node
    @tail.prev = node
  end

  def update(key, val)
    self.each do |node|
      node.val = val if node.key == key
    end
  end

  def remove(key)
    # debugger
    self.each do |node|
      node.remove if node.key == key
    end
  end

  def each(&prc)
    # debugger
    current = first
    until current == @tail
      prc.call(current)
      current = current.next
    end
  end

  # uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  end
end
