require_relative 'binary_search_tree'

bst = BinarySearchTree.new
bst.balance((Array.new(50) { rand(1..100) }))
bst.pretty_print