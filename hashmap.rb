require_relative "node"
require_relative "linked_list"

# HashMap
class HashMap
  attr_accessor :buckets, :capacity, :load_factor, :total_entries

  def initialize
    @buckets = [nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil]
    @capacity = buckets.size
    @load_factor = 0.75
    @total_entries = (capacity * load_factor).round
  end

  def hash(key)
    hash_code = 0
    prime_number = 31

    key.each_char { |char| hash_code = (prime_number * hash_code) + char.ord }

    hash_code
  end

  def set(key, value)
    capacity.times { buckets << nil } if buckets.compact.size >= total_entries

    hash_code_index = hash(key) % capacity
    if buckets[hash_code_index].nil?
      buckets[hash_code_index] = LinkedList.new
      buckets[hash_code_index].append(key, value)
    elsif buckets[hash_code_index].contains?(key)
      buckets[hash_code_index].head.value = value
    else
      buckets[hash_code_index].append(key, value)
    end
  end

  def get(key)
    hash_code_index = hash(key) % capacity
    buckets[hash_code_index].head.key == key ? buckets[hash_code_index].head.value : nil
  end

  def has?(key)
    hash_code_index = hash(key) % capacity
    buckets[hash_code_index].head.key == key
  end

  def remove(key)
    hash_code_index = hash(key) % capacity
    return nil unless buckets[hash_code_index].head.key == key

    value = buckets[hash_code_index].head.value
    buckets[hash_code_index] = nil
    value
  end

  def length
    buckets.compact.size
  end

  def clear
    self.buckets = [nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil]
  end

  def keys
    lists = buckets.compact
    keys = []
    lists.map { |element| keys << element.head.key }
    keys
  end

  def values
    lists = buckets.compact
    values = []
    lists.map { |element| values << element.head.value }
    values
  end

  def entries
    lists = buckets.compact
    entries = []
    lists.map do |element|
      temp = element.head

      until temp.nil?
        entries << [temp.key, temp.value]

        temp = temp.next_node
      end
    end
    entries
  end
end
