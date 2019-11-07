module Slideable
  HORIZONTAL_DIRS = [[1,0], [-1,0], [0,1], [0,-1]]
  DIAGONAL_DIRS = [[1,1], [-1,1], [1,-1],[-1,-1]]
  def horizontal_dirs
    h_moves = []
    HORIZONTAL_DIRS.each do |dir|
      h_moves.concat(grow_unblocked_moves_in_dir(dir[1], dir[0]))
    end
    h_moves
  end

  def diagnol_dirs
    d_moves = []
    DIAGONAL_DIRS.each do |dir|
      cur_pos = [self.pos[0]+dir[0], self.pos[1]+dir[1]]
      while cur_pos[0] >= 0 && cur_pos[0] <=7 && cur_pos[1] >= 0 && cur_pos[1] <=7
        d_moves << cur_pos
        cur_pos = [cur_pos[0]+dir[0], cur_pos[1]+dir[1]]
      end
    end
    d_moves
  end

  def moves
    move_1 = self.horizontal_dirs
    move_2 = self.diagnol_dirs
    moves = [move_1, move_2]
  end

  private

  def move_dirs
    "    ."
  end

  def grow_unblocked_moves_in_dir(dx, dy)
    h_moves = []
    cur_pos = [self.pos[0]+dy, self.pos[1]+dx]
    while cur_pos[0] >= 0 && cur_pos[0] <=7 && cur_pos[1] >= 0 && cur_pos[1] <=7
      unless @board[cur_pos].is_a?(NullPiece)
        if @board[cur_pos].color == self.color
          return h_moves
        else
          h_moves << cur_pos 
          return h_moves
        end 
      end
      h_moves << cur_pos
      cur_pos = [cur_pos[0]+dy, cur_pos[1]+dx]
    end
    return h_moves
  end
end