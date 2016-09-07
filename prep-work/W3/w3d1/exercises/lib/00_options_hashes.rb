# Options Hashes
#
# Write a method `transmogrify` that takes a `String`. This method should
# take optional parameters `:times`, `:upcase`, and `:reverse`. Hard-code
# reasonable defaults in a `defaults` hash defined in the `transmogrify`
# method. Use `Hash#merge` to combine the defaults with any optional
# parameters passed by the user. Do not modify the incoming options
# hash. For example:
#
# ```ruby
# transmogrify("Hello")                                    #=> "Hello"
# transmogrify("Hello", :times => 3)                       #=> "HelloHelloHello"
# transmogrify("Hello", :upcase => true)                   #=> "HELLO"
# transmogrify("Hello", :upcase => true, :reverse => true) #=> "OLLEH"
#
# options = {}
# transmogrify("hello", options)
# # options shouldn't change.
# ```

def transmogrify(string,options={})
  default = {
    times: 1,
    upcase: false,
    reverse: false
  }

  new_string = string
  options = default.merge(options)

  new_string = new_string * options[:times]
  new_string = new_string.upcase if options[:upcase]
  new_string = new_string.reverse if options[:reverse]

  new_string

  # operations = options.select {|operation,flag| flag && operation != :times}.keys
  # operations.each do |operation|
  #   string = string.operation
  # end

end
