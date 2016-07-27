# Muni Routes
# ----------------------------------------
# You are at a busy intersection and need to get to brunch ASAP. There
# are multiple Muni buses that go by, but you don't know which to take.
# Given a hash of routes (with route number as the key and next stop on the
# route as the value) return the number of the first route in the hash that
# could get you to your brunch spot. If none exist, return nil.

def muni_routes(routes, destination)
end

# puts "---------Muni Routes----------"
# puts muni_routes({3 => "Arizmendi", 27 => "Nopalito", 55 => "Brenda's Soul Food"}, "Brenda's Soul Food") == 55
# puts muni_routes({7 => "Devil's Teeth", 33 => "Devil's Teeth"}, "Devil's Teeth") == 7
# puts muni_routes({90 => "Padrecito", 43 => "Hard Knox", 67 => "Martha's"}, "Hard Knox") == 43
# puts muni_routes({10 => "Good Luck Dim Sum", 25 => "Art's Cafe"}, "Japanese Tea Hut") == nil



# ----------------- Switch Roles!



# Largest Factor
# ----------------------------------------
# Write a method, #largest_factor, that accepts an integer as an argument and returns
# the largest factor of that integer

def largest_factor(n)
  (n-1).downto(1) do |number|
    if n%number == 0
      return number
    end
  end
end

puts "---------Muni Routes----------"
puts largest_factor(10) == 5
puts largest_factor(143) == 13
puts largest_factor(27) == 9
puts largest_factor(17) == 1
