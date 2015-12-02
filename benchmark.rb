# Accepts a block and returns how many seconds
# it takes to execute the code in the block.
def benchmark
  start_time = Time.now
  result = yield
  end_time = Time.now
  benchmark = end_time - start_time
end
