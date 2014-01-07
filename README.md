# Simple Benchmarking With Blocks 
 
##Learning Competencies 

* Writing methods that take a block parameter
* Returning values from blocks

##Summary 

This is a small challenge to learn more about how blocks work in Ruby.  Think about methods for a second.  You call a method with data from the outside world &mdash; the method's arguments &mdash; that the code inside your method can see and use.

If arguments are how we pass in data into ours method, blocks are how we pass in behavior.  Think of them as a chunk of logic or a "brain" that your method can yield to.

Blocks can be passed into methods as a sort of "invisible argument", like this:

```ruby
def print_result
  block_execution = yield
  puts block_execution
end

# This will print out the number 9 to the console
print_result { 3 * 3 }

# Blocks can also be written using the do...end format
print_result do
  creature = "walrus"
  "I am the #{creature}!"
end

# Blocks have access to variables outside of their definition

shopping_list = [:milk, :eggs, :cheese]
print_result do
  important_item = shopping_list.sample
  "I hope I don't forget #{important_item}!!!"
end
```

As you will notice, the call to `yield` in the method definition is where the block is executed.

Let's write something practical using blocks.  A common scenario is wanting to benchmark some code.  The "skeleton" involved in benchmarking doesn't need to know what it's benchmarking, but it should be responsible for keeping track of how long it's running and other benchmarking-specific concerns.

That is, it shouldn't care whether we're benchmarking a simple function to add two numbers or something much more complicated.

Without blocks we might write code like this:

```ruby
start_time = Time.now

# Calculate the 100th Fibonacci number
fibonacci(100)

end_time = Time.now

# This will return the difference in the timestamps in seconds
running_time = end_time - start_time

puts "fibonacci(100) took #{running_time} seconds."
```

Let's use blocks to create a `benchmark` method that can benchmark anything.

##Releases

###Release 0 : Write the `benchmark` method

Write a `benchmark` method which takes a block and returns the running time (in seconds) of that block.  It should work like this:

```ruby
# Be careful, pasting this into IRB will take a long time to print.
# It's a loooong string. :)
long_string = "apple"*100000000

running_time = benchmark { long_string.reverse }

puts "string.reverse took #{running_time} seconds to run"
``` 
<!-- ##Optimize Your Learning  -->

##Resources

* [Blocks and Yield in Ruby](http://stackoverflow.com/questions/3066703/blocks-and-yields-in-ruby)
* [The Building Blocks of Ruby](http://yehudakatz.com/2010/02/07/the-building-blocks-of-ruby/)
