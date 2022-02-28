class BinarySearchTree
  def initialize
    @root = nil
  end

  def build_tree(array, node = @root)
    array = array.uniq.sort
    if array.length > 2
      middle = array[(array.length - array.length / 2) - 1]
      middle_index = (array.length - array.length / 2) - 1
      if @root.nil?
        @root = Node.new(middle, build_tree(array[0..(middle_index - 1)]), build_tree(array[(middle_index + 1)..array.length - 1]))
      else
        Node.new(middle, build_tree(array[0..(middle_index - 1)]), build_tree(array[(middle_index + 1)..array.length - 1]))
      end
    elsif array.length == 2
      Node.new(array[1], Node.new(array[0]))
    else
      Node.new(array[0])
    end
  end

  def in_order(node = @root, array = [])
    if !node.left.nil? && !node.right.nil?
      in_order(node.left, array)
      array.push(node.data)
      in_order(node.right, array)
    elsif !node.left.nil?
      in_order(node.left, array)
      array.push(node.data)
    elsif !node.right.nil?
      in_order(node.right, array)
      array.push(node.data)
    else
      array.push(node.data)
    end
    array
  end



  # def insert(value)
  #   stop = false
  #   current_node = @root
  #   until stop == true
  #     if value > current_node.data
  #       if current_node.right.nil?
  #         current_node.right = Node.new(value)
  #         stop = true
  #       else
  #         current_node = current_node.right
  #       end
  #     else
  #       if current_node.left.nil?
  #         current_node.left = Node.new(value)
  #         stop = true
  #       else
  #         current_node = current_node.left
  #       end
  #     end
  #   end
  # end

  # def insert_node(value)
  #   stop = false
  #   current_node = @root
  #   until stop == true
  #     if value.data > current_node.data
  #       if current_node.right.nil?
  #         current_node.right = value
  #         stop = true
  #       else
  #         current_node = current_node.right
  #       end
  #     else
  #       if current_node.left.nil?
  #         current_node.left = value
  #         stop = true
  #       else
  #         current_node = current_node.left
  #       end
  #     end
  #   end
  # end

  # def delete(value)
  #   stop = false
  #   current_node = @root
  #   previous_node = nil
  #   last_right = true
  #   until current_node.data == value || stop == true
  #     if value > current_node.data
  #       if current_node.right.nil?
  #         stop = true
  #         puts "#{value} not found in data."
  #       else
  #         last_right = true
  #         previous_node = current_node
  #         current_node = current_node.right
  #       end
  #     else
  #       if current_node.left.nil?
  #         stop = true
  #         puts "#{value} not found in data."
  #       else
  #         last_right = false
  #         previous_node = current_node
  #         current_node = current_node.left
  #       end
  #     end
  #   end
  #   if current_node.data == value
  #     if current_node.right.nil? && current_node.left.nil?
  #       if last_right
  #         previous_node.right = nil
  #       else
  #         previous_node.left = nil
  #       end
  #     elsif current_node.right.nil?
  #       if last_right
  #         previous_node.right = current_node.left
  #       else
  #         previous_node.left = current_node.left
  #       end
  #     elsif current_node.left.nil?
  #       if last_right
  #         previous_node.right = current_node.right
  #       else
  #         previous_node.left = current_node.right
  #       end
  #     else
  #       if last_right
  #         previous_node.right = nil
  #         insert_node(current_node.right)
  #         insert_node(current_node.left)
  #       else
  #         previous_node.left = nil
  #         insert_node(current_node.right)
  #         insert_node(current_node.left)
  #       end
  #     end
  #   end
  # end

  # def balance(array)
  #   p array
  #   new_array = array.uniq.sort
  #   mid_value = new_array[(new_array.length - new_array.length/2)-1]
  #   mid_index = new_array.length - new_array.length/2
  #   left_array = new_array[0..(mid_index)]
  #   right_array = new_array[(mid_index + 2)..new_array.length]
  #   @root = Node.new(mid_value)
  #   recursive_balance(left_array, @root)
  #   recursive_balance(right_array, @root)
  # end

  # def recursive_balance(array, node)
  #   if array.length > 2
  #     new_array = array
  #     mid_value = new_array[(new_array.length - new_array.length/2)-1]
  #     mid_index = (new_array.length - new_array.length/2)-1
  #     left_array = new_array[0..(mid_index - 1)]
  #     right_array = new_array[(mid_index + 1)..new_array.length]
  #     new_node = Node.new(mid_value)
  #     if mid_value > node.data
  #       node.right = new_node
  #       recursive_balance(left_array, new_node)
  #       recursive_balance(right_array, new_node)
  #     else
  #       node.left = new_node
  #       recursive_balance(left_array, new_node)
  #       recursive_balance(right_array, new_node)
  #     end
  #   elsif array.length == 2
  #     if array[0] > node.data
  #       node.right = Node.new(array[0], nil, Node.new(array[1]))
  #     else
  #       node.left = Node.new(array[0], nil, Node.new(array[1]))
  #     end
  #   else
  #     if array[0] > node.data
  #       node.right = Node.new(array[0])
  #     else
  #       node.left = Node.new(array[0])
  #     end
  #   end
  #   @root.data
  # end

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
