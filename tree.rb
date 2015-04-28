require_relative "linked_list"

require 'pp'

def Tree(value)
  case value
  when Tree
    value
  else
    Tree.new(value)
  end
end


# Implement a generic tree class.  Each node
# is also a Tree and can have any number of children.
class Tree
  attr_reader :value, :children
  def initialize(value)
    @value    = value
    @children = LinkedList.new
  end

  # Add a new child to this node
  # O(1) time
  def add_child(value)
    @children.unshift(Tree(value))
  end

  def each(&block)
    tree_node = self.children
    block.call(self)
    tree_node.each { |child| child.each(&block) }
  end
end

# if __FILE__ == $PROGRAM_NAME

# t = Tree.new(5)
# t.add_child(2)
# t.add_child(3)
# t.add_child(4)
# t.children.head.value.add_child(7)
# t.children.head.value.add_child(8)
# t.children.head.value.add_child(9)
# t.children.head.next.value.add_child(44)
# t.children.head.next.value.add_child(54)
# t.children.head.next.value.add_child(64)
# t.children.head.value.children.head.value.add_child(10)
# t.children.head.value.children.head.next.value.add_child(12)
# t.children.head.value.children.head.next.next.value.add_child(14)

# t

# t.each do |child|
#   puts child.value
# end



# end


