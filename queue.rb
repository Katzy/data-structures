require_relative "linked_list"
# Implement a Queue using a linked list
# Note:
#   1. All operations should take O(1) time
#   2. You'll need to modify the LinkedList to achieve constant
#      time enqueue and dequeue operations.

class Queue
  def initialize
    @queue = LinkedList.new
  end

  # Places +item+ at the back of the queue
  def enqueue(item)
    @queue.push(item)
  end

  # Removes the item at the front of the queue and returns it
  # Raises an error if the queue is empty
  def dequeue
    @queue.shift
  end

  # Return the item at the front of the queue without dequeing it
  def peek
    @queue.head.value
  end

  # Return true if the queue is empty and false otherwise
  def empty?
    @queue.head.value.nil?
  end

  # Return the number of items on the stack
  def size
    @queue.length
  end
end
