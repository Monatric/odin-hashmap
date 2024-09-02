require_relative "hashmap"
require_relative "node"

test = HashMap.new
test2 = test.set("sean", "zidane")
test2 = test.set("sean", "dumlao")

p test.buckets[15].head
