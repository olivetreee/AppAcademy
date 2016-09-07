require "byebug"

class Hangman
  attr_reader :guesser, :referee, :board

  def initialize(players = {})
    @guesser = players[:guesser]
    @referee = players[:referee]
    @board = []
  end

  def play
    setup
    # puts @referee.secret_word
    while @board.include?(nil)
      puts "What's your guess?"
      display_board
      take_turn
    end
    puts "Got it:"
    display_board
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

  attr_reader :guesses

  def initialize
    @guesses = []
  end

#PLAYER AS REFEREE
def dictionary_from_file(file_name)
  dictionary_words = File.readlines(file_name)
  dictionary_words
end

def pick_secret_word
  @secret_word = @dictionary.sample.chomp
  # define_chars_positions
  @secret_word.length
end

def check_guess(char)
  guess = char.to_sym
  @secret_chars_positions[guess]
end



#PLAYER AS GUESSER
  def register_secret_length(length)
    @secret_length = length
  end

  def guess(board)
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

end

class ComputerPlayer

  attr_reader :dictionary, :secret_word, :guesses, :candidate_words

  def initialize(dictionary=nil)
    @dictionary = dictionary || dictionary_from_file("./lib/dictionary.txt")
    @secret_word = ""
    @secret_chars_positions = {}
    @secret_length = 0
    @remaining_characters = ("a".."z").to_a
    @candidate_words = []
  end


#COMPUTER AS REFEREE
  def dictionary_from_file(file_name)
    dictionary_words = File.readlines(file_name)
    dictionary_words
  end

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
  player = HumanPlayer.new
  computer = ComputerPlayer.new
  game = Hangman.new(guesser: player, referee: computer)
  game.play
end
