require_relative "linked_list"

# Implement a "min-max stack" - a stack that has contant-time
# "maximum" _and_ "minimum" operations.



class MinMaxStack

  class DimensionError < StandardError;end

  attr_accessor :items

  def initialize
    @list = LinkedList.new
    @items = []
  end

  # Places +item+ on the top of the stack
  def push(item)
    @list.unshift(item)
    @items.push(item)

    self
  end

  # Removes the item on the top of the stack and returns it.
  # Raises an error if the stack is empty (called a "stack underflow")
  def pop
    if self.empty?
      raise DimensionError, "The stack is empty!"
    else
      @items = @items - [@list.head.value]
      @list.shift
    end
  end

  # Return the item on the top of the stack without removing it
  def peek
    @list.head.value
  end

  # Return true if the stack is empty and false otherwise
  def empty?
    @list.empty?
  end

  # Return the number of items on the stack
  def size
    @list.length
  end

  # Returns the smallest item on the stack
  def min
    @items.min
  end

  # Returns the largest item on the stack
  # O(1) time
  def max
    @items.max
  end
end
