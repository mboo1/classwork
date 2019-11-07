require_relative "slidingpieces.rb"
require_relative "piece.rb"
class Queen < Piece

  # def initialize(pos, color, board)
  #   super
  # end
  include Slideable

  def symbol
    :Q
  end

  protected
  def move_dirs
    self.moves[0]+self.moves[1]

  end

end