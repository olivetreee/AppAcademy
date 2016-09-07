# I/O Exercises
#
# * Write a `guessing_game` method. The computer should choose a number between
#   1 and 100. Prompt the user to `guess a number`. Each time through a play loop,
#   get a guess from the user. Print the number guessed and whether it was `too
#   high` or `too low`. Track the number of guesses the player takes. When the
#   player guesses the number, print out what the number was and how many guesses
#   the player needed.
# * Write a program that prompts the user for a file name, reads that file,
#   shuffles the lines, and saves it to the file "{input_name}-shuffled.txt". You
#   could create a random number using the Random class, or you could use the
#   `shuffle` method in array.

def guessing_game
  guessed_number = -1 #Starting at a value that will never be the computer_number
  computer_number = computer_chooses_number
  guesses = 0
  until guessed?(guessed_number, computer_number)
    puts "guess a number:"
    guessed_number = gets.chomp.to_i
    puts guessed_number
    check_guess(guessed_number,computer_number)
    guesses += 1
  end
  puts computer_number
  puts guesses
  # puts "The number was #{computer_number}"
  # puts "It took you #{guesses} guesses"
end

def computer_chooses_number
  num = rand(99)+1
end

def guessed?(guess,computer)
  guess == computer
end

def check_guess(guess,computer)
  if guess > computer
    puts "too high"
  elsif guess < computer
    puts "too low"
  else
    puts "You guessed it!"
  end
end

# @@@@@@@@@@@@@@@@@@@@@@@ RANDOM FILE LINES @@@@@@@@@@@@@@@@@@@@@@@ #

def shuffle_file
  puts "Please type the file name"
  file_name = gets.chomp
  file_contents = File.readlines(file_name)
  file_extension = File.extname(file_name)
  file_name = File.basename(file_name,".*")
  shuffled_lines = shuffle_file_lines(file_contents)
  new_file = "#{file_name}-shuffled#{file_extension}"
  write_to_file(shuffled_lines, new_file)
  puts "Done! Go check #{new_file}"
end

def shuffle_file_lines(lines)
  lines.shuffle
end

def write_to_file(new_lines,file)
  File.open(file, "w") do |f|
    new_lines.each do |line|
      f.puts line
    end
  end
end

if __FILE__ == $PROGRAM_NAME
  shuffle_file
end
