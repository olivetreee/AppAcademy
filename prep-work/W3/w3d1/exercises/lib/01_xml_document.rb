require "byebug"

class XmlDocument

  def initialize(indent = false)
    @indent = indent
    @number_of_spaces = 0
  end

  def method_missing(name,*arguments,&block)
    arguments = arguments.first || {}
    if block_given?
      evaluate_block(name,arguments,block)
    else
      empty_tag(name,arguments)
    end
  end


  private

  def tag_parameters(arguments)
    parameters = arguments.map {|key,value| %Q( #{key}="#{value}")}
    parameters.join(" ")
  end

  def opening_tag(name,args)
    "#{indentation}<#{name}#{tag_parameters(args)}>#{next_line}"
  end

  def closing_tag(name)
    "#{indentation}</#{name}>#{next_line}"
  end

  def empty_tag(name,args)
    "#{indentation}<#{name}#{tag_parameters(args)}/>#{next_line}"
  end

  def evaluate_block(name, arguments, block)
    #print opening
    #increment
    #call block
    #decrement
    #print close
    open_tag = opening_tag(name,arguments)
    @number_of_spaces += 2 if @indent
    block_result = block.call
    @number_of_spaces -= 2 if @indent
    close_tag = closing_tag(name)
    "#{open_tag}#{block_result}#{close_tag}"
  end

  def next_line
    @indent ? "\n" : ""
  end

  def indentation
    if @indent
      " " * @number_of_spaces
    else
      ""
    end
  end

end
