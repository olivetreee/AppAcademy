require 'byebug'
require 'sqlite3'
require 'singleton'

class PlayDBConnection < SQLite3::Database
  include Singleton

  def initialize
    super('plays.db')
    self.type_translation = true
    self.results_as_hash = true
  end
end

class Play
  attr_accessor :title, :year, :playwright_id

  def self.all
    data = PlayDBConnection.instance.execute("SELECT * FROM plays")
    data.map { |datum| Play.new(datum) }
  end

  def self.find_by_title(title)
    Play.all.each do |play|
      return play unless play.title.index(title).nil?
    end
    nil
  end

  def self.find_by_playwright(name)
    playwright = Playwright.find_by_name(name)
    playwright.get_plays
    # Play.all.select{|play| play.playwright_id == name.}
  end

  def initialize(options)
    @id = options['id']
    @title = options['title']
    @year = options['year']
    @playwright_id = options['playwright_id']
  end

  def create
    raise "#{self} already in database" if @id
    PlayDBConnection.instance.execute(<<-SQL, @title, @year, @playwright_id)
      INSERT INTO
        plays (title, year, playwright_id)
      VALUES
        (?, ?, ?)
    SQL
    @id = PlayDBConnection.instance.last_insert_row_id
  end

  def update
    raise "#{self} not in database" unless @id
    PlayDBConnection.instance.execute(<<-SQL, @title, @year, @playwright_id, @id)
      UPDATE
        plays
      SET
        title = ?, year = ?, playwright_id = ?
      WHERE
        id = ?
    SQL
  end
end

class Playwright

  attr_reader :name

  def self.all
    all_data = PlayDBConnection.instance.execute("SELECT * FROM playwrights")
    all_data.map {|data| Playwright.new(data)}
  end

  def self.find_by_name(name)
    Playwright.all.each do |playwright|
      return playwright unless playwright.name.index(name).nil?
    end
    nil
  end

  def initialize(options)
    @id = options["id"]
    @name = options["name"]
    @birth_year = options["birth_year"]
  end

  def create
    raise "#{self} already exists in the db" if @id
    PlayDBConnection.instance.execute(<<-SQL, @name, @birth_year
      INSERT INTO
        playwrights (name, birth_year)
      VALUES
        (?, ?)
    SQL
    )
    @id = PlayDBConnection.instance.last_insert_row_id
  end

  def get_plays
    Play.all.select{|play| play.playwright_id == @id}
  end

end
