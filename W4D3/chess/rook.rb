require_relative "slidingpieces.rb"
require_relative "piece.rb"
class Rook < Piece

  # def initialize(pos, color, board)
  #   super
  # end
  include Slideable

  def symbol
    :R
  end

  protected
  def move_dirs
    self.moves[0]
  end

end