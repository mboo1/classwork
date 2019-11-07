# require_relative "rook.rb"
require "byebug"

class Piece

  attr_writer :pos, :color
  attr_reader :pos, :color

  
  def initialize(pos=nil, color=nil, board=nil)
    @pos = pos
    @color = color
    @board = board
  end

  def to_s
    puts "#{self.symbol}, #{@color}"
  end

  def symbol
    :X
  end
  
  # def empty?
    
    

  # end
  
  def valid_moves
    # debugger
    self.move_dirs
  end

  def pos=(val)
    @pos = val
  end

  private

  def move_into_check?(end_pos)
    self.valid_moves.any? {|pos| pos == end_pos }
  end

end