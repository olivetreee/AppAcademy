class Friend

  def initialize(name="Vader")
    @name = name
  end

  def greeting(who=nil)
    return who ? "Hello, #{who}!" : "Hello!"
  end
end
