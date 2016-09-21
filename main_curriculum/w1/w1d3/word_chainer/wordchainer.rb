require 'set'

class WordChainer
  def initialize(file_name)
    words = File.readlines(file_name).map(&:chomp)
    @dictionary = Set.new(words)
    @current_words = []
    @all_seen_words = {}
  end

  def adjacent_words(word)
    @dictionary.select! {|ele| ele.length == word.length}
    results = []
    word.each_char.with_index do |char,idx|
      ("a".."z").each do |letter|
        new_word = word.dup
        new_word[idx] = letter
        results += [new_word] if @dictionary.include?(new_word)
      end
    end
    results.uniq
  end

  def run(source_word, target_word)
    @current_words = [source_word]
    @all_seen_words = {source_word => nil}
    until @current_words.empty?
      new_current_words = explore_current_words
      @current_words = new_current_words
    end
    puts build_path(target_word)
  end

  def explore_current_words
    new_current_words = []
    @current_words.each do |current_word|
      current_adjacent_words = adjacent_words(current_word)
      current_adjacent_words.each do |current_adjacent_word|
        next if @all_seen_words.has_key?(current_adjacent_word)
        new_current_words << current_adjacent_word
        @all_seen_words[current_adjacent_word] = current_word
      end
    end
    new_current_words
  end

  def build_path(target)
    return "no path exist" unless @all_seen_words.has_key?(target)
    path = [target]
    current_word = target
    until @all_seen_words[current_word].nil?
      path << @all_seen_words[current_word]
      current_word = @all_seen_words[current_word]
    end
    path
  end

end

if __FILE__ == $PROGRAM_NAME
  chainer = WordChainer.new("dictionary.txt")
  p chainer.run("market","basket")
end
