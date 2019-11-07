require_relative "steppable.rb"
require_relative "piece.rb"
class Knight < Piece

  # def initialize(pos, color, board)
  #   super
  # end
  include Steppable

  def symbol
    :KN
  end

  protected
  def move_dirs
    self.moves[1]

  end

end