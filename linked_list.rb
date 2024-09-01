require_relative "node"

# linked list
class LinkedList
  attr_accessor :name, :head, :tail

  def initialize
    @head = nil
    @tail = nil
  end

  def append(value)
    if @head.nil?
      @head = Node.new(value)
    else
      temp = @head
      temp = temp.next_node until temp.next_node.nil?
      temp.next_node = Node.new(value)
      self.tail = temp.next_node
    end
  end

  def prepend(value)
    @head = Node.new(value, @head)
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

  # def head
  #   @head.value
  # end

  def at(index)
    temp = @head
    i = 0
    until temp.nil?
      return temp.value if index == i

      return nil if temp.nil?

      temp = temp.next_node

      i += 1
    end
  end

  def pop
    return "Canoot delete" if head.nil?
    return self.head = nil if @head.next_node.nil?

    cur = @head
    prev = nil

    until cur.next_node.nil?
      prev = cur
      cur  = cur.next_node
    end
    prev.next_node = nil
    p cur.value
  end

  def contains?(value)
    temp = @head
    until temp.nil?
      return true if temp.value == value
      return false if temp.next_node.nil?

      temp = temp.next_node
    end
  end

  def find(value)
    temp = @head
    i = 0
    until temp.nil?
      return i if temp.value == value

      i += 1
      temp = temp.next_node
    end
  end

  def to_s
    temp = @head
    string = ""
    until temp.nil?
      string << "( #{temp.value} ) -> "
      string << "nil" if temp.next_node.nil?
      temp = temp.next_node
    end
    string
  end
end
