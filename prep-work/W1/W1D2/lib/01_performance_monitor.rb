def measure (num_times = 1, &blc)
  puts ""
  puts "----"
  t_0 = Time.now  #Time.now gets altered on some of the exercises, being set to 11am.
  puts "Starting at #{t_0}"
  num_times.times do
    blc.call
    puts Time.now
  end
  t_1 = Time.now
  puts "Ending at #{t_1}"
  average_time = (t_1 - t_0)/num_times
  puts "It took an average time of #{average_time} seconds"
  puts "----"
  average_time
end
