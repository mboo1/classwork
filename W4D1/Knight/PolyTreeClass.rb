class PolyTreeNode

    attr_reader :parent, :value, :children

    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end
    #node.parent=(new_parent)

    def parent=(name)
        if self.parent != nil 
            old_parent = self.parent
            old_parent.children.delete(self)
        end 
        @parent = name
        if name != nil && !name.children.include?(self)
         
            name.children << self
        end

        # if self.parent == name
        #     return name
        # else
        #     @children << name <= self, self.parent.childre 
        # end
    end

    def add_child(child) 
        child.parent = self 
    end

    def remove_child(child_node)
        if child_node != nil && !self.children.include?(child_node)
            raise "No good!"
        end
        self.children.delete(child_node)
        child_node.parent = nil
    end

    
    def dfs(target)
       return self if @value == target 
       @children.each do |child|
            result = child.dfs(target) 
            return result if result != nil 
       end
       return nil   

    end     

    def bfs(target)
        queue = []
        queue << self
         until queue.empty?
            current_node = queue.shift
            return current_node if current_node.value == target 
            queue = queue + current_node.children 
         end 
         nil 
    end 


end