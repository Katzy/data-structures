require_relative "tree"

class Trie
  attr_reader :root

  def children
    self.root.children || self.children
  end

  attr_accessor :prefix

  def initialize
    @root = Tree.new(nil)
    @prefix = []
  end

  def find(item)
    tree_node = self.root.children.head
    temp_node = nil

    prefix = []

    until tree_node.value.nil?
      if tree_node.value.value == item[0]
        prefix.push(item[0])
        temp_node = tree_node
        item = item[1..-1]
        tree_node = tree_node.value.children.head
      else
        tree_node = tree_node.next
      end
    end

      @prefix = prefix
      temp_node
  end

  def insert(item)

    prefix = []

    if find(item) == nil
      temp = self.root
      until item.length == 0
        temp.add_child(item[0])
        prefix.push(item[0])
        item = item[1..-1]
        temp = temp.children.head.value
      end
    else
      temp_node = find(item).value
      times = item.length - self.prefix.length  # difference between item string and prefix
      item = item[-times, times]
      until item.length == 0
        temp_node.add_child(item[0])
        prefix.push(item[0])
        item = item[1..-1]
        temp_node = temp_node.children.head.value
      end
    end
    self
  end
end

