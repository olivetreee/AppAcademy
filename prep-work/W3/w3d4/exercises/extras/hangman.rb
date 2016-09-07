require "byebug"

class Hangman
  attr_reader :guesser, :referee, :board

  def initialize(players = {})
    @guesser = players[:guesser]
    @referee = players[:referee]
    @board = []
    @guesses_left = 6
  end

  def play
    setup
    # puts @referee.secret_word
    while @board.include?(nil) && @guesses_left > 0
      display_board
      puts "Guesses left: #{@guesses_left}"
      take_turn
      puts ""
    end

    if @guesses_left == 0
      puts "#{@guesser.name} lose!"
      puts "The word was #{@referee.secret_word}."
    else
      puts "#{@guesser.name} won!"
      display_board
    end

  end

  def setup
    secret_length = @referee.pick_secret_word
    @guesser.register_secret_length(secret_length)
    @board = setup_board(secret_length)
  end

  def take_turn
    guess = @guesser.guess(@board)
    response = @referee.check_guess(guess)
    update_board(guess,response) unless response.empty?
    @guesser.handle_response(guess, response)
    @guesses_left-=1 if response.empty?
  end

  def update_board(guess,response)
    response.each do |position|
      @board[position] = guess
    end
  end

  def display_board
    puts @board.map {|char| char.nil? ? "_" : char}.join
  end


  private

  def setup_board(length)
    @board = Array.new(length,nil)
  end

end

class HumanPlayer

  attr_reader :guesses, :name, :secret_word

  def initialize
    @dictionary = dictionary_from_file("./lib/dictionary.txt")
    @guesses = []
    @name = "You"
  end

#PLAYER AS REFEREE
def dictionary_from_file(file_name)
  dictionary_words = File.readlines(file_name)
  dictionary_words
end

def pick_secret_word
  @secret_word = @dictionary.sample.chomp
  display_secret_word
  @secret_word.length
end

def check_guess(char)
  puts "The computer guessed: #{char}"
  puts "Type the positions separated by commas, or hit ENTER if guess is wrong:"
  positions = gets.chomp
  positions = positions.split(",").map(&:to_i)
  display_secret_word
  positions.map{|pos| pos-1}
end



#PLAYER AS GUESSER
  def register_secret_length(length)
    @secret_length = length
  end

  def guess(board)
    puts "Your guesses so far:"
    puts @guesses.sort.join(", ")
    puts "What's your guess?"
    guess = gets.chomp
    until valid_guess?(guess)
      puts "Invalid/Repeat guess. Try again:"
      guess = gets.chomp
    end
    @guesses << guess
    guess
  end

  def handle_response(gues,response)
  end

  private

  def valid_guess?(guess)
    a = ("a".."z").to_a.include?(guess)
    b = @guesses.include?(guess)
    a && !b
  end

  def display_secret_word
    puts "The secret word is:"
    spaces = @secret_word.length/9>0 ? "  " : " "
    @secret_word.each_char {|char| print "#{char}#{spaces}"}
    puts ""
    (1..@secret_word.length).each {|num| print "#{num}#{spaces}"}
    puts ""
    # puts "The secret word is #{@secret_word}"
  end

end

class ComputerPlayer

  attr_reader :dictionary, :guesses, :candidate_words, :name, :secret_word

  def initialize(dictionary=nil)
    @dictionary = dictionary || dictionary_from_file("./lib/dictionary.txt")
    @secret_word = ""
    @secret_chars_positions = {}
    @secret_length = 0
    @remaining_characters = ("a".."z").to_a
    @candidate_words = []
    @name = "Computer"
  end


  def dictionary_from_file(file_name)
    dictionary_words = File.readlines(file_name)
    dictionary_words.map(&:chomp)
  end

#COMPUTER AS REFEREE

  def pick_secret_word
    @secret_word = @dictionary.sample.chomp
    @secret_chars_positions = define_chars_positions(@secret_word)
    @secret_word.length
  end

  def check_guess(char)
    guess = char.to_sym
    @secret_chars_positions[guess]
  end


#COMPUTER AS GUESSER
  def register_secret_length(length)
    @secret_length = length
    @candidate_words = select_candidates
  end

  def guess(board)
    exclude_from_guess = all_board_nil?(board) ? [] : get_uniqs(board)
    get_most_common_char(@candidate_words, exclude_from_guess)
  end

  def handle_response(guess, response)
    #1. for each candidate word, define the position of each of its chars
    #2. grab the position from the char that matches the guess
    #3. filter ou candidate words to those whose chars positions
    #   match the response position
    candidates_char_positions = {}

    @candidate_words.each do |candidate|
      position = define_chars_positions(candidate)
      candidates_char_positions[candidate] = position[guess.to_sym]
    end
    @candidate_words = @candidate_words.select do |candidate|
      candidates_char_positions[candidate] == response
    end

    if @candidate_words.length==1
      raise "The word is #{@candidate_words[0]}!"
    end

  end


  private

  def define_chars_positions(word)
    positions = Hash.new{|h,k| h[k] = []}
    word.each_char.with_index do |char,idx|
      positions[char.to_sym] << idx
    end
    positions
  end

  def select_candidates
    @dictionary.select {|word| word.chomp.length == @secret_length}
  end

  def get_most_common_char(words,exclude_chars)
    #Go through each char of each word and count their occurances
    #Grab the largest one
    max_count = 0
    most_common = ""
    char_count = Hash.new(0)

    words.each do |word|
      word.each_char do |char|
        char_count[char]+=1 unless exclude_chars.include?(char)
      end
    end

    ##sort_by returns an array of arrays. Get the #last for largest
    #and then #first for the key (char, in this case)
    raise "Ran out of guesses. Are you playing fair?" if char_count.empty?
    char_count.sort_by{|char,count| count}.last.first
  end

  def all_board_nil?(board)
    board.all?{|char| char.nil?}
  end

  def get_uniqs(array)
    #This is so we get rid of nils
    array.join.split("").uniq
  end

end

if __FILE__ == $PROGRAM_NAME
  puts "Welcome to Hang-all-sexes, the politically correct version of Hangman!"
  player = ""
  until player == "me" || player == "you"
    puts "Who's guessing? Type me for you or you for me."
    player = gets.chomp
  end

  if player == "me"
    guesser = HumanPlayer.new
    referee = ComputerPlayer.new
  else
    guesser = ComputerPlayer.new
    referee = HumanPlayer.new
  end
  game = Hangman.new(guesser: guesser, referee: referee)
  game.play
end
