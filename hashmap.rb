require_relative "node"
require_relative "linked_list"

# HashMap
class HashMap
  attr_accessor :buckets, :capacity, :load_factor

  def initialize
    @buckets = []
    16.times { @buckets << [LinkedList.new] }
    @capacity = buckets.size
    @load_factor = 0.8
  end

  def hash(key)
    hash_code = 0
    prime_number = 31

    key.each_char { |char| hash_code = (prime_number * hash_code) + char.ord }

    hash_code
  end

  def set(key, value)
    hash_code = hash(key)
    hash_code_index = hash_code % capacity
    p hash_code_index
    buckets[hash_code_index].append(key, value)
    p buckets[hash_code_index]
  end
end
