class BinarySearchTree
  def initialize
    @root = nil
  end

  
  def build_tree(array)
     remove_array = array.uniq
     remove_dup = remove_array.sort
     mid_value = remove_dup[remove_dup.length - remove_dup.length/2]
     @root = Node.new(mid_value)
     for value in remove_array
      if value == @root.data
        next
      else
        current_node = @root
        stop = false
        until stop == true
          if value > current_node.data
            # puts "#{value} goes right at: #{current_node.data}"
            if !current_node.right.nil?
            current_node = current_node.right
            else
              current_node.right = Node.new(value)
              stop = true
            end
          else
            # puts "#{value} goes left at: #{current_node.data}"
            if !current_node.left.nil?
              current_node = current_node.left
            else
              current_node.left = Node.new(value)
              stop = true
            end
          end
        end
      end
     end
  end

  def balance(array)
    new_array = array.uniq.sort
    mid_value = new_array[(new_array.length - new_array.length/2)-1]
    mid_index = new_array.length - new_array.length/2
    left_array = new_array[0..(mid_index)]
    right_array = new_array[(mid_index + 2)..new_array.length]
    @root = Node.new(mid_value)
    recursive_balance(left_array, @root)
    recursive_balance(right_array, @root)
  end

  def recursive_balance(array, node)
    if array.length > 2
      new_array = array
      mid_value = new_array[(new_array.length - new_array.length/2)-1]
      mid_index = (new_array.length - new_array.length/2)-1
      left_array = new_array[0..(mid_index - 1)]
      right_array = new_array[(mid_index + 1)..new_array.length]
      new_node = Node.new(mid_value)
      if mid_value > node.data
        node.right = new_node
        recursive_balance(left_array, new_node)
        recursive_balance(right_array, new_node)
      else
        node.left = new_node
        recursive_balance(left_array, new_node)
        recursive_balance(right_array, new_node)
      end
    elsif array.length == 2
      if array[0] > node.data
        node.right = Node.new(array[0], nil, Node.new(array[1]))
      else
        node.left = Node.new(array[0], nil, Node.new(array[1]))
      end
    else
      if array[0] > node.data
        node.right = Node.new(array[0])
      else
        node.left = Node.new(array[0])
      end
    end
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end


  class Node
    attr_accessor :data, :left, :right

    def initialize(data, left = nil, right = nil)
      @data = data
      @left = left
      @right = right
    end
  end
end