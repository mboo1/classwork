module Steppable
  def moves
    
    move_1 = [
    [-2, -1],
    [-2,  1],
    [-1, -2],
    [-1,  2],
    [ 1, -2],
    [ 1,  2],
    [ 2, -1],
    [ 2,  1]
  ]
  move_2 = [
    [1,-1],
    [1,0],
    [0,-1],
    [-1,-1],
    [-1,0],
    [-1,1],
    [0,1],
    [1,1]
  ]

    knight_moves = []
    move_1.each do |move|
      end_pos = [self.pos[0] + move[0], self.pos[1] + move[1]]
       if end_pos[0] >= 0 &&end_pos[0] <=7 &&end_pos[1] >= 0 && end_pos[1] <=7
          if @board[end_pos].is_a?(NullPiece) || (@board[end_pos].color != self.color)
              knight_moves << end_pos
          end
       end
    end

    king_moves = []
    move_2.each do |move|
      end_pos = [self.pos[0] + move[0], self.pos[1] + move[1]]
       if end_pos[0] >= 0 &&end_pos[0] <=7 &&end_pos[1] >= 0 && end_pos[1] <=7
          if @board[end_pos].is_a?(NullPiece) || (@board[end_pos].color != self.color)
              king_moves << end_pos
          end
       end
    end
    return [king_moves, knight_moves]

  end

  private

  def move_dirs
    "    ."
  end

  
end