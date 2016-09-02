class Dictionary

  attr_reader :entries, :keywords

  def initialize
    @entries = {}
  end

  def add(entry)
    if entry.is_a?(Hash)
      @entries.merge!(entry)
    else
      @entries[entry] = nil
    end
  end

  def keywords
    @entries.keys.sort
  end

  def include?(key)
    keywords.include?(key)
  end

  def find(key)
    @entries.select do |word, definition|
      /#{key}/ === word  #=== is the case equality operator. Can be used for finding regex matches of a word
    end
  end

  def printable
    to_print = []
    keywords.each do |kw|
      to_print << %Q([#{kw}] "#{@entries[kw]}")
    end
    to_print.join("\n")
  end

end
