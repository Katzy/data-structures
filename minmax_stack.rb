require_relative "min_stack"
require_relative "max_stack"


class MinMaxStack < Stack

  attr_accessor :items

  def initialize
    @stak = Stack.new
    @mini_stack = MinStack.new
    @maxx_stack = MaxStack.new
  end

  # Places +item+ on the top of the stack
  def push(item)
    @mini_stack.push(item)
    @maxx_stack.push(item)
    @stak.push(item)
  end

  # Removes the item on the top of the stack and returns it.
  # Raises an error if the stack is empty (called a "stack underflow")
  def pop
    if self.empty?
      raise UnderflowError, "The stack is empty!"
    else
      @mini_stack.pop
      @maxx_stack.pop
      @stak.pop
    end
  end

  # Return the item on the top of the stack without removing it
  def peek
    @stak.peek.value
  end

  # Return true if the stack is empty and false otherwise
  def empty?
    @stak.empty?
  end

  # Return the number of items on the stack
  def size
    @stak.size
  end

  # Returns the smallest item on the stack
  def min
    @mini_stack.min
  end

  # Returns the largest item on the stack
  # O(1) time
  def max
    @maxx_stack.max
  end
end
