# Simple Benchmarking With Blocks

## Summary
When we define methods, it's common for them to accept arguments. For example, we've written methods that accept a string argument in order to [convert it to pig latin][pig latin challenge], [scan it for a social security number][regular expressions challenge], etc. Arguments allow us to pass data to our methods, and as our methods execute, they use this data.  

We can also write methods that allow users to pass in behavior—what happens when a method is called.  Where we use arguments to pass data into our methods, we use blocks to pass in behavior.

```ruby
def calculate
  calculation = yield
end

calculate { 2 + 2 }
# => 4
calculate { 3 * 4 }
# => 12
```
*Figure 1*.  Defining and calling a method that executes a block.

In Figure 1, we define and then call a `calculate` method.  When we call the method, we pass in a block.  The first time we call the method, we pass in the block `{ 2 + 2 }`.  The second time, we pass the block `{ 3 * 4 }`.  The blocks represent pieces of code that we want the method to execute.  Within the method, we use the `yield` keyword to call for the code in the block to be executed.


### Syntax of Working with Blocks
```ruby
calculate { 5 * 7 }
# => 35

calculate do
  product = 5 * 7
  product + 1
end
# => 36
```
*Figure 2*.  Different syntax options for defining a block.

We have choices when it comes to how we define the blocks that we pass to our methods.  We can use curly braces:  `{ ... }`.  Or, we can use `do ... end`.  We generally use curly braces if our block only contains one statement and is written on one line.  If we have multiple statements and our code is written on more than one line, we favor `do ... end`. (see Figure 2)

```ruby
def verify(expected)
    yield(expected)
end

verify(5) { |n| n == 2 + 3 }
# => true
verify(9) { |n| n == 2 + 3 }
# => false
```
*Figure 3*.  Defining a block that accepts an argument.

As with methods, blocks can accept arguments.  In Figure 3, the blocks that we pass to the `verify` method need data to be passed into them in order to function.  So, when we yield, we pass the block the argument that it needs—in the same way that we would pass an argument to a method.








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

[pig latin challenge]: ../../../pig-latin-challenge
[regular expressions challenge]: ../../../ruby-drill-regular-expressions-challenge
