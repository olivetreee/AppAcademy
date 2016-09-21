#Why use |_,v| and not |k,v|?
def display_standings
  return if losses.all? { |_, v| v == 0 }
end
