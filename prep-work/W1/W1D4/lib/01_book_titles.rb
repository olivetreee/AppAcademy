class Book
  attr_reader :title

  def initialize(title="")
    @title = title
  end

  def title=(title)
    non_capitalized = ["and", "the", "in", "of", "a", "an", "to"]
    title_words = title.split

    words_capitalized = title_words.map.with_index do |word,idx|
      next word if idx != 0 && non_capitalized.include?(word)
      word.capitalize
    end

    @title = words_capitalized.join(" ")
  end

end
