require_relative "node"
require_relative "linked_list"

# HashMap
class HashMap
  attr_accessor :buckets, :capacity, :load_factor

  def initialize
    @buckets = []
    16.times { @buckets << LinkedList.new }
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
    if buckets[hash_code_index].head.nil?
      buckets[hash_code_index].append(key, value)
    elsif buckets[hash_code_index].contains?(key)
      buckets[hash_code_index].head.value = value
    else
      buckets[hash_code_index].append(key, value)
    end
  end
end
