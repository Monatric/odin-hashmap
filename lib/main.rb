require_relative "hashmap"
require_relative "node"

test = HashMap.new
test.set("apple", "red")
test.set("banana", "yellow")
test.set("carrot", "orange")
test.set("dog", "brown")
test.set("elephant", "gray")
test.set("frog", "green")
test.set("grape", "purple")
test.set("hat", "black")
test.set("ice cream", "white")
test.set("jacket", "blue")
test.set("kite", "pink")
test.set("lion", "golden")

test.set("jacket", "test")

test.set("jacket", "testtwo")

test.set("moon", "silver")

test.set("jacket", "testthree")
p test.buckets.size
p test.get("jacket")
