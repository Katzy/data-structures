require_relative 'linked_list'

# Implement a Stack class using a linked list

class Stack
  class UnderflowError < StandardError; end

  attr_reader :list

  def initialize
    @list = LinkedList.new
  end

  # Places +item+ on the top of the stack
  # O(1) time
  def push(item)
    @list.unshift(item)
  end

  # Removes the item on the top of the stack and returns it.
  # Raises an error if the stack is empty (called a "stack underflow")
  # O(1) time

  def pop
    @list.shift
  end

  # Return the item on the top of the stack without removing it
  # O(1) time
  def peek
    @list.head
  end

  # Return true if the stack is empty and false otherwise
  # O(1) time
  def empty?
    @list.head.value.nil?
  end

  # Return the number of items on the stack
  # O(1) time
  def size
    @list.length
  end
end
