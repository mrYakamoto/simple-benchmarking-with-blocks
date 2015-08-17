require_relative 'benchmark'

# Be careful, pasting this into IRB will take a long time to print.
# It's a loooong string. :)

long_string  = "apple"*100000000
running_time = benchmark { long_string.reverse }

puts "The #reverse method took #{running_time} seconds to run."
