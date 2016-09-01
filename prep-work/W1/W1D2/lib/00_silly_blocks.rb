# require 'byebug'

def reverser (&blabla)
  string = blabla.call
  words = string.split(" ")
  words.map! {|word| word.reverse}
  words.join(" ")
end

def adder (num=1,&proc)
  num_2 = proc.call
  num+num_2
end

def repeater (num=1,&proc)
  num.times {proc.call}
end
