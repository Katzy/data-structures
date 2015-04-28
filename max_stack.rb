require_relative "linked_list"
require_relative "stack"

# Implement a "max stack" - a stack that has a contant-time
# "maximum" operations.


class MaxStack < Stack

  def initialize
    @stak = Stack.new
    @maximum = Stack.new
  end

  # Places +item+ on the top of the stack
  def push(item)
    if @maximum.peek.value == nil
      @maximum.push(item)
    elsif item > @maximum.peek.value
      @maximum.push(item)
    elsif item <= @maximum.peek.value
      temp = @maximum.list.head.value
      @maximum.push(temp)
    end
    @stak.push(item)
  end

  # Removes the item on the top of the stack and returns it.
  # Raises an error if the stack is empty (called a "stack underflow")
  def pop
    if @stak.empty?
      raise UnderflowError, "Stack is empty fool!"
    else
      @maximum.pop
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

  # Returns the largest item on the stack
  # O(1) time
  def max
    @maximum.peek.value
  end
end
