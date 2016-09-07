require 'byebug'

class RPNCalculator

OPERATORS = ["+", "-", "*", "/"]

attr_reader :value

  def initialize
    @value = 0
    @stack = []
  end

  def run_prompt_calculator
    input_stack = ""
    while true
      puts "Type a number, operator or hit ENTER to exit:"
      puts input_stack
      input = gets.chomp
      break if input.empty?
      input = float_notation(input) unless is_operator?(input)
      input_stack += " #{input}"
    end
    puts "Final answer: #{evaluate(input_stack)}"
  end

  def run_file_calculator(file)
    file_content = File.read(file)
    puts "Evaluating the following: #{file_content}"
    puts "Final answer: #{evaluate(file_content)}"
  end


  def push(val)
    @stack << val
  end

  def plus
    calculate(:+)
  end

  def minus
    calculate(:-)
  end

  def times
    calculate(:*)
  end

  def divide
    calculate(:/)
  end

  def evaluate(operations_as_string)
    expression = tokens(operations_as_string)
    expression.each do |el|
      if el.is_a?(Symbol)
        calculate(el)
      else
        push(el)
      end
    end
    @value
  end

  def tokens(operations_as_string)
    expression = operations_as_string.split
    expression.map do |el|
      el = is_operator?(el) ? el.to_sym : el.to_f
    end
  end


  private

  def get_from_stack
    val_1 = @stack.pop
    raise "calculator is empty" if val_1.nil?
    val_2 = @stack.pop
    [val_1.to_f,val_2]
  end

  def calculate(operation)
    val_1, val_2 = get_from_stack
    case operation
    when :+
      @value = val_1 + val_2
    when :-
      @value = val_2 - val_1
    when :*
      @value = val_1 * val_2
    when :/
      @value = val_2 / val_1
    end
    @stack << @value
  end

  def is_operator?(input)
    OPERATORS.include?(input)
  end

  def float_notation(number)
    num = number.to_f.to_s
  end
end

if __FILE__ == $PROGRAM_NAME
  calculator = RPNCalculator.new
  if ARGV.empty?
    calculator.run_prompt_calculator
  else
    calculator.run_file_calculator(ARGV[0])
  end
end
