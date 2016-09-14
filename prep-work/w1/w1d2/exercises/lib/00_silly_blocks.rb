# require 'byebug'

def reverser (&bloc)
  words = bloc.call.split(" ")
  words.map {|word| word.reverse}.join(" ")
end

def adder (num=1,&bloc)
  num + bloc.call
end

def repeater (num=1,&proc)
  num.times {proc.call}
end
