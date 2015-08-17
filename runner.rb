require_relative 'benchmark'


long_string  = "apple"*100000000
running_time = benchmark { long_string.reverse }

puts "The #reverse method took #{running_time} seconds to run."
