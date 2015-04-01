class LinkedList
  # By implementing LinkedList#each, we can include Enumerable
  include Enumerable

  attr_reader :head, :tail, :length

  def initialize
    @head = LinkedListNode.new(nil)
    #@tail = LinkedListNode.new(nil)
    @length = 0
  end


  def push(value)
    @head = @head.insert_after(value)
    @length += 1
    self
  end

  def unshift(value)
    @head = @head.insert_before(value)
    @length += 1
    self
  end

  # O(1) time
  def shift
    result = @head.value
    @head = @head.next
    @length = [length - 1, 0].max

    result
  end

  # O(1) time
  def empty?
    self.head.empty?
  end

  def each(&block)
    node = self.head

    until node.empty?
      block.call(node.value)
      node = node.next
    end

    self
  end

end

# This allows us to call LinkedListNode(value) and is different
# than the class "LinkedListNode".  This is how Ruby methods
# like Integer(value), Array(value), String(value), etc.
# work.
def LinkedListNode(value)
  case value
  when LinkedListNode
    value
  else
    LinkedListNode.new(value)
  end
end

class LinkedListNode
  attr_accessor :value, :next

  def initialize(value = nil, next_node = nil)
    @value = value
    @next  = next_node
  end

  # O(1) time
  # Insert +value+ after this LinkedListNode and return new LinkedListNode
  def insert_after(value)
    if self.value.nil?
      self.value = LinkedListNode(value)
    else
      current = self
      node = LinkedListNode(value)

      while current.next != nil
        current = current.next
      end
      current.next = node


      self
    end
  end

  # O(1) time
  # Insert +value+ before this LinkedListNode and return new LinkedListNode
  def insert_before(value)
    node = LinkedListNode(value)

    node.next = self

    node
  end

  def empty?
    value.nil?
  end
end
