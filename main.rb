require_relative "hashmap"
require_relative "node"

test = HashMap.new
test.set("sean", "zidane")
test.set("sean", "dumlao")
p test.buckets[15]
p test.remove("sean")
