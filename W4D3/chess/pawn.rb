require_relative "piece.rb"

class Pawn < Piece

  def symbol
    :P
  end

  def move_dirs

    moves = []
    moves << [self.forward_dir,0] 
    moves << [self.forward_dir*2,0] if self.at_start_row?
    moves << self.side_attacks
    return moves


  end
private
  def at_start_row?
    if self.color == "white" && self.pos[0] == 1
      return true 
    elsif self.color == "black" && self.pos[0] == 6
      return true
    else
      return false
    end
  end

  def forward_dir
    return 1 if self.color == "white"
    return -1 if self.color == "black"
  end

  def side_attacks
    attacks = []
    if self.color == "white"
      attacks << [self.pos[0]+1, self.pos[1]-1] if @board[self.pos[0]+1, self.pos[1]-1].color == "black"
      attacks << [self.pos[0]+1, self.pos[1]+1] if @board[self.pos[0]+1, self.pos[1]+1].color == "black"
    else
      attacks << [self.pos[0]-1, self.pos[1]-1] if @board[self.pos[0]-1, self.pos[1]-1].color == "white"
      attacks << [self.pos[0]-1, self.pos[1]+1] if @board[self.pos[0]-1, self.pos[1]+1].color == "white"
    end
    return attacks

  end
end



