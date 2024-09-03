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
    hash_code_index = hash(key) % capacity
    raise IndexError if index.negative? || index >= @buckets.length

    insert(hash_code_index, key, value)

    grow if entries.size > total_entries
  end

  def grow
    old_bucket = entries
    old_capacity = capacity
    clear
    old_capacity.times { buckets << nil }
    self.capacity = buckets.length
    self.total_entries = (capacity * load_factor).round
    old_bucket.each do |bucket|
      hash_code_index = hash(bucket[0]) % capacity

      insert(hash_code_index, bucket[0], bucket[1])
    end
  end

  def insert(index, key, value)
    if buckets[index].nil?
      buckets[index] = LinkedList.new
      buckets[index].append(key, value)
    elsif buckets[index].contains?(key)
      buckets[index].head.value = value
    else
      buckets[index].append(key, value)
    end
  end

  def get(key)
    hash_code_index = hash(key) % capacity
    return nil if buckets[hash_code_index].nil?

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
    entries.size
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
