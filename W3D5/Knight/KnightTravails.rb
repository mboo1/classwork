require_relative "PolyTreeClass"
class KnightPathFinder

    @@Moves = [ 
        [2, -1],
        [2, 1],
        [-2, 1],
        [-2, -1],
        [1, -2],
        [1, 2],
        [-1, -2],
        [-1, 2]
    ]

    def initialize(start)
        @start = start 
        @root_node = PolyTreeNode.new(@start)
        @considered_positions = [@start]
    end 

    def build_move_tree
       queue = [@root_node]
        until queue.empty?
            curr_node = queue.shift
            next_move_positions = self.new_move_positions(curr_node.value)
            next_move_positions.each do |pos|
                new_node = PolyTreeNode.new(pos)
                curr_node.add_child(new_node)
                queue << new_node 
            end 
        end 
    end 

    def self.valid_moves(pos)
        x = pos[0]
        y = pos[1]
        valid_moves = []
        @@Moves.each do |move|
            next_move = [x+move[0], y+move[1]]
            if self.on_board?(next_move)
                # @considered_positions << next_move
                valid_moves << next_move
            end
        end
        valid_moves
    end

    def self.on_board?(pos)
        if pos[0] > 7 || pos[0] < 0
            return false
        elsif pos[1] > 7 || pos[1] < 0
            return false
        end
        true
    end

    def new_move_positions(pos)
        new_moves = KnightPathFinder.valid_moves(pos)
        new_moves.select! {|move| !@considered_positions.include?(move) }        
        @considered_positions += new_moves
        return new_moves
    end 

end 