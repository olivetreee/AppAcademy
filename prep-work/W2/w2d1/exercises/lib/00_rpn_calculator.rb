class RPNCalculator

OPERATORS = ["+", "-", "*", "/"]

attr_reader :value

  def initialize
    @value = 0
    @stack = []
  end

  def push(val)
    @stack << val
  end

  def plus
    calculate(:+)
    # val_1, val_2 = get_from_stack
    # @value = val_1 + val_2
    # @stack << @value
  end

  def minus
    calculate(:-)
    # val_1, val_2 = get_from_stack
    # @value = val_2.to_f - val_1
    # @stack << @value
  end

  def times
    calculate(:*)
    # val_1, val_2 = get_from_stack
    # @value = val_1.to_f * val_2
    # @stack << @value
  end

  def divide
    calculate(:/)
    # val_1, val_2 = get_from_stack
    # @value = val_2.to_f / val_1
    # @stack << @value
  end

  def tokens(operations_as_string)
    expression = operations_as_string.split
    expression.map do |el|
      el = OPERATORS.include?(el) ? el.to_sym : el.to_i
    end
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
end
