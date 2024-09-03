require_relative "hashmap"
require_relative "node"

test = HashMap.new
test.set("sean", "zidane")
test.set("sean", "dumlao")
test.set("test", "Test")
# p test.buckets[15]
p test.entries
# p test.remove("sea")
# p test.length
# test.clear
# p test.clear
# p test.length
