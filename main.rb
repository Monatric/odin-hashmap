require_relative "hashmap"

test = HashMap.new
test2 = test.set("t", "t")
p test.buckets[4].key
