require_relative 'linked_list'

# Implement a Stack class using a linked list

class Stack
  class UnderflowError < StandardError; end
  def initialize
    @stack = LinkedList.new
  end

  # Places +item+ on the top of the stack
  # O(1) time
  def push(item)
    @stack.unshift(item)
  end

  # Removes the item on the top of the stack and returns it.
  # Raises an error if the stack is empty (called a "stack underflow")
  # O(1) time
  def pop
    @stack.shift
  end

  # Return the item on the top of the stack without removing it
  # O(1) time
  def peek
    @stack.head
  end

  # Return true if the stack is empty and false otherwise
  # O(1) time
  def empty?
    @stack.head.value.nil?
  end

  # Return the number of items on the stack
  # O(1) time
  def size
    @stack.length
  end
end
