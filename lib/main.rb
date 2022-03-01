require_relative 'binary_search_tree'

test_array = (Array.new(16) { rand(1..20) })
p test_array


bst = BinarySearchTree.new
bst.build_tree(test_array)
# bst.balance(test_array)
# bst.pretty_print
# bst.insert(123)
# bst.insert(150)
# bst.pretty_print
# bst.delete(123)
# bst.pretty_print
# bst.delete(85)
bst.pretty_print
# p bst.in_order
# bst.level_order{|x, y| puts "Node number #{y} is: #{x}"}
bst.delete(2)
bst.pretty_print
bst.insert(21)
bst.insert(20)
bst.pretty_print