require_relative 'binary_search_tree'

test_array = [53, 12, 91, 96, 71, 80, 26, 81, 20, 81, 17, 49, 26, 3, 3, 32, 14, 84, 90, 41, 53, 96, 81, 68, 98, 88, 96, 23, 10, 71, 20, 30, 49, 42, 34, 92, 44, 84, 6, 74, 12, 3, 85, 87, 21, 25, 38, 98, 28, 88]


bst = BinarySearchTree.new
bst.balance(test_array)
bst.pretty_print
bst.insert(123)
bst.insert(150)
bst.pretty_print
bst.delete(123)
bst.pretty_print
bst.delete(85)
bst.pretty_print