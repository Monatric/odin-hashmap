require_relative "hashmap"
require_relative "node"

test = HashMap.new
test.set("sean", "zidane")
p test.buckets[15]

test.set("sean", "dumlao")

p test.buckets[15]
