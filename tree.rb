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
    node = self.children
    until node.empty?
      block.call(node.head.value)
      node = node.children
    end
    self

  end
end


