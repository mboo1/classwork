require_relative "steppable.rb"
require_relative "piece.rb"
class King < Piece

  # def initialize(pos, color, board)
  #   super
  # end
  include Steppable

  def symbol
    :K
  end

  protected
  def move_dirs
    self.moves[0]
  end

end