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
  secret_number = computer_chooses_number
  guessed_number = secret_number + 1
  guesses = 0

  until guessed?(guessed_number, secret_number)
    puts "Guess a number:"
    guessed_number = gets.chomp.to_i
    check_guess(guessed_number,secret_number)
    guesses += 1
  end

  puts "The secret number was #{secret_number}."
  puts "You guessed it after #{guesses} guesses."
end

def computer_chooses_number
  num = rand(99)+1
end

def guessed?(guess,computer)
  guess == computer
end

def check_guess(guess,computer)
  if guess > computer
    response = "too high."
  elsif guess < computer
    response = "too low."
  else
    response = "correct!"
  end
  puts "You guessed #{guess} and that is #{response}"
end

# @@@@@@@@@@@@@@@@@@@@@@@ RANDOM FILE LINES @@@@@@@@@@@@@@@@@@@@@@@ #

def shuffle_file(file)
  file_contents = File.readlines(file)
  file_extension = File.extname(file)
  file_name = File.basename(file,".*")
  file_path = File.dirname(file)

  shuffled_lines = shuffle_file_lines(file_contents)
  new_file = "#{file_path}/#{file_name}-shuffled#{file_extension}"
  write_to_file(shuffled_lines, new_file)
  puts "Done! Go check #{new_file}"
end

def shuffle_file_lines(lines)
  lines.shuffle
end

def write_to_file(new_lines,file)
  File.open(file, "w") do |f|
    new_lines.each do |line|
      f.puts line.chomp
    end
  end
end

if __FILE__ == $PROGRAM_NAME
  puts "To shuffle a file, please guess the number first:"
  guessing_game
  puts ""
  puts "Now, please type the file name you'd like to shuffle:"
  file_name = gets.chomp
  shuffle_file(file_name)
end
