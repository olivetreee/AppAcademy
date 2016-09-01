def measure (num_times = 1)
  puts "----"
  t_0 = Time.now  #Time.now gets altered on some of the exercises, being set to 11am.
  puts "Starting at #{t_0}"
  bla = num_times.times do
    yield
    puts Time.now
  end
  t_1 = Time.now
  puts "Ending at #{t_1}"
  (t_1 - t_0)/num_times
end
