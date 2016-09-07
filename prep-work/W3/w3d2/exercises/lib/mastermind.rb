class Code

  PEGS = {
    "r"=> "red",
    "g"=> "green",
    "b"=> "blue",
    "y"=> "yellow",
    "o"=> "orange",
    "p"=> "purple"
  }

  attr_reader :pegs

  def initialize(input_code)
    @pegs = input_code
  end

  def [](index)
    @pegs[index]
  end

  def exact_matches(code)
    matches = 0
    @pegs.each_with_index do |peg,idx|
      matches += 1 if code[idx] == peg
    end
    matches
  end

  def near_matches(code)
    #self: yyyb = 3y, 1b
    #code: bboy = 2b, 1o, 1y
    #The intersection is the smallest of the two, hence 1y and 1b
    matches = 0
    code_peg_counts = count_pegs(code.pegs)
    self_peg_counts = count_pegs(@pegs)
    self_peg_counts.each do |peg,count|
      matches+= [count,code_peg_counts[peg]].min
    end
    matches - self.exact_matches(code)
  end

  def self.parse(input_string)
    input_code = input_string.downcase.chars
    unless input_code.all? {|char| PEGS.keys.include?(char)}
      raise "Invalide code"
    end
    Code.new(input_code)
  end

  def self.random
    random_code = []
    4.times {random_code << PEGS.keys.sample}
    Code.new(random_code)
  end

  def ==(code)
    return false unless code.instance_of?(Code)
    true if exact_matches(code) == 4
  end

  private

  def count_pegs(pegs)
    count = Hash.new(0)
    pegs.each {|peg| count[peg]+=1}
    count
  end

end

class Game

  MAX_TURNS = 12

  attr_reader :secret_code

  def initialize(code = Code.random)
    @secret_code = code
  end

  def get_guess
    puts "Enter your guess as 'bbbb'"
    ARGV.clear  #Spec was failing since it was getting ARGV beore going for $stdin
    guess = gets.chomp
    Code.parse(guess)
  end

  def display_matches(code)
    puts "#{@secret_code.exact_matches(code)} exact match(es)"
    puts "#{@secret_code.near_matches(code)} near match(es)"
  end

  def start

    MAX_TURNS.times do |try|
      puts "#{12-try} tries left"
      guessed_code = get_guess
      display_matches(guessed_code)
      if guessed_code == @secret_code
        puts "You win!"
        return
      end
      puts ""
    end
    puts "You lose! The code was #{@secret_code.pegs.join}"
  end

end

if __FILE__ == $PROGRAM_NAME
  code = Code.parse('rgby')
  Game.new(code).start
end
