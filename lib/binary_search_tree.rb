class BinarySearchTree
  def initialize
    @root = nil
  end

  
  def build_tree(array)
     remove_dup = array.uniq
     mid_value = remove_dup[remove_dup.length - remove_dup.length/2]
     @root = Node.new(mid_value)
     for value in remove_dup
      if value = @root.value
        continue
      else
        current_node = @root
        stop = false
        until stop == true
          if value > current_node
            if !current_node.right.nil?
            current_node = current_node.right
            else
              stop = true
            end
          else
            if !current_node.right.nil?
              current_node = current_node.right
            else
              stop = true
            end
          end
        end
        current_node = Node.new(value)
      end
     end
  end


  class Node
    attr_accessor :value :left :right

    def initialize(value, left = nil, right = nil)
      @value = value
      @left = left
      @right = right
    end
end