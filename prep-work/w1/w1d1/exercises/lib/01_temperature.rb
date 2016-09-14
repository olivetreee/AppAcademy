def ftoc(temp_f)
  (temp_f-32) * 5.0/9
end

def ctof(temp_c)
  temp_c * 9/5.0 + 32
end

#COMMENTS
#Last test uses #be_within because the == operator will most probably return false when comparing two floats.
#That happens becuse of a computer (language agnostic) limitation, where 0.1 is actually something like 0.10000005234613.
#Therefore, it's safer to compare a float with a delta of values instead of a specific value.
