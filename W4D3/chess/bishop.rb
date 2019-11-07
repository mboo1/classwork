require_relative "slidingpieces.rb"
require_relative "piece.rb"
class Bishop < Piece

  # def initialize(pos, color, board)
  #   super
  # end
  include Slideable

  def symbol
    :B
  end

  protected
  def move_dirs
    self.moves[1]

  end

end