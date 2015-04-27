require_relative "tree"

class Trie
  attr_reader :root, :prefix

  def initialize
    @root = Tree.new(nil)
    @prefix = []    # keeping track of characters of prefix
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
      temp_node = self.root
    else
      temp_node = find(item).value
      item_size = item.length - self.prefix.length  # difference in size between item string and prefix
      item = item[-item_size, item_size]   # remaining item to be inserted into Trie
    end
    until item.length == 0
      temp_node.add_child(item[0])
      prefix.push(item[0])
      item = item[1..-1]
      temp_node = temp_node.children.head.value
    end
    p prefix

    self
  end
end

