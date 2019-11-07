require_relative "piece.rb"
require 'singleton'

class NullPiece < Piece
  include Singleton

  # def initialize(a, b, c)
  #   super
  # end
  
  def symbol
    :N
  end

  def moves
    ""
  end
end