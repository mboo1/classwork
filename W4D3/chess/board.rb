require_relative "./piece.rb"
require_relative "rook.rb"
require_relative "nullpiece.rb"
require_relative "bishop.rb"
require_relative "king.rb"
require_relative "knight.rb"
require_relative "pawn.rb"
require_relative "queen.rb"
require "byebug"
class Board

  def initialize
    @grid = Array.new(8){Array.new(8)} 
    # populate board with generic piece from Piece class
    
    self.populate

  end

  def populate
    (0...@grid.length).each do |row|
      (0...@grid[0].length).each do |col|
        if row == 1 
          @grid[row][col] = Pawn.new([row,col], 'white', self)
        elsif row == 6
          @grid[row][col] = Pawn.new([row,col], 'black', self)
        elsif row != 0 && row != 7 
          @grid[row][col] = NullPiece.instance
        end

      end
       
    end
          @grid[0][0] = Rook.new([0,0], 'white', self)
          @grid[7][0] = Rook.new([7,0], 'black', self)
          @grid[0][1] = Knight.new([0,1], 'white', self)
          @grid[0][2] = Bishop.new([0,2], 'white', self)
          @grid[0][3] = King.new([0,3], "white", self)
          @grid[0][4] = Queen.new([0,4], "white", self)
          @grid[0][5] = Bishop.new([0,5], "white", self)
          @grid[0][6] = Knight.new([0,6], "white", self)
          @grid[0][7] = Rook.new([0,7], "white", self)
          @grid[7][1] = Knight.new([7,1], 'black', self)
          @grid[7][2] = Bishop.new([7,2], 'black', self)
          @grid[7][3] = King.new([7,3], 'black', self)
          @grid[7][4] = Queen.new([7,4], 'black', self)
          @grid[7][5] = Bishop.new([7,5], 'black', self)
          @grid[7][6] = Knight.new([7,6], 'black', self)
          @grid[7][7] = Rook.new([7,7], 'black', self)
    
  end



  def [](pos)
    # debugger
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, new_piece)
    row, col = pos
    @grid[row][col] = new_piece
  end

  def move_piece(start_pos, end_pos)
    raise "Invalid move" unless self[start_pos].is_a?(Piece)
    raise "Invalid move" if end_pos[0] > 7 || end_pos[0] < 0 || end_pos[1] >7 || end_pos[1] <0
    raise "Invalid move" if self[end_pos].is_a?(Piece)

    current_piece = self[start_pos]
    self[end_pos] = current_piece
    self[start_pos] = NullPiece.instance #Later will be replaced by NullPiece
    current_piece.pos = end_pos
  end





end