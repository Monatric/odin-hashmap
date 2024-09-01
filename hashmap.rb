# HashMap
class HashMap
  attr_accessor :buckets

  def initialize
    buckets = []
    16.times { buckets << [] }
  end

  def hash(key)
    hash_code = 0
    prime_number = 31

    key.each_char { |char| hash_code = (prime_number * hash_code) + char.ord }

    hash_code
  end

  def set(key, value)
    hash_code_of_key = hash(key)
  end
end
