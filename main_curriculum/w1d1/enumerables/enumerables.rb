class Array
  def my_each (&blck)
    for idx in (0...self.length)
      blck.call(self[idx])
    end
    self
  end

  def my_select (&blck)
    result = []
    self.my_each do |el|
      result << el if blck.call(el)
    end
    result
  end

  def my_reject (&blck)
    result = []
    self.my_each do |el|
      result << el unless blck.call(el)
    end
    result
  end

  def my_any? (&blck)
    self.my_each do |el|
      return true if blck.call(el)
    end
    false
  end

  def my_all? (&blck)
    self.my_each do |el|
      return false unless blck.call(el)
    end
    true
  end

  def my_flatten
    result = []
    self.my_each do |el|
      if el.is_a?(Array)
        arr = el.my_flatten
        arr.my_each {|i| result << i}
      else
        result << el
      end
    end
    result
  end

  def my_zip(*args)
    result = []
    self.each_with_index do |el,idx|
      tmp = [el]
      args.each do |arg|
        tmp << arg[idx]
      end
      result << tmp
    end
    result
  end

  def my_rotate(num=1)
    if num > 0
      num.times do
        self << self.shift
      end
    else
      num*=-1
      num.times do
        self.unshift (self.pop)
      end
    end
    self
  end

  def my_join(separator = "")
    result = ""
    self.my_each do |char|
      result += char + separator
    end
    new_length = result.length - separator.length
    result[0...new_length]
  end

  def my_reverse
    result = []
    self.each do |el|
      result.unshift(el)
    end
    result
  end
end
