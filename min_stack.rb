require_relative "stack"

# Implement a "min stack" - a stack that has a contant-time
# "minimum" operations.

class MinStack < Stack

  def initialize
    @stak = Stack.new
    @minimum = Stack.new
  end

  # Places +item+ on the top of the stack
  def push(item)
    if @minimum.peek.value == nil
      @minimum.push(item)
    elsif item < @minimum.peek.value
      @minimum.push(item)
    elsif item >= @minimum.peek.value
      temp = @minimum.list.head.value
      @minimum.push(temp)
    end
    @stak.push(item)
  end

  # Removes the item on the top of the stack and returns it.
  # Raises an error if the stack is empty (called a "stack underflow")
  def pop
    if @stak.empty?
      raise UnderflowError, "Stack is empty fool!"
    else
      @minimum.pop
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
  # O(1) time
  def min
    @minimum.peek.value
  end
end
