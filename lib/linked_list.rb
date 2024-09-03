require_relative "node"

# linked list
class LinkedList
  attr_accessor :head, :tail

  def initialize
    @head = nil
    @tail = nil
  end

  def append(key, value)
    if @head.nil?
      @head = Node.new(key, value)
    else
      temp = @head
      temp = temp.next_node until temp.next_node.nil?
      temp.next_node = Node.new(key, value)
      self.tail = temp.next_node
    end
  end

  def size
    counter = 0
    temp = @head
    until temp.nil?
      counter += 1
      temp = temp.next_node
    end
    counter
  end

  def contains?(key)
    temp = @head
    until temp.nil?
      return true if temp.key == key
      return false if temp.next_node.nil?

      temp = temp.next_node
    end
  end
end
