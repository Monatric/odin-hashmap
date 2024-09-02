# node
class Node
  attr_accessor :key, :next_node, :value

  def initialize(key = nil, value = kil, next_node = nil)
    @key = key
    @value = value
    @next_node = next_node
  end
end
