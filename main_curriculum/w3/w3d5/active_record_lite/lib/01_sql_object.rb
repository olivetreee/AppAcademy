require 'byebug'
require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject

  def self.columns
    @cols ||= DBConnection.execute2(<<-SQL)
      SELECT * FROM #{self.table_name}
    SQL
    @cols.first.map(&:to_sym)
  end

  def self.finalize!
    columns.each do |col|
      # byebug
      define_method("#{col}=") do |val|
        attributes #initializing @attributes if not already
        @attributes[col]=val
      end
      define_method("#{col}") do
        @attributes[col]
      end
    end
  end

  def self.table_name=(table_name)
    @table_name = table_name
  end

  def self.table_name
    @table_name ||= self.name.tableize
  end

  def self.all
    results = DBConnection.execute(<<-SQL)
      SELECT * FROM #{self.table_name}
    SQL

    parse_all(results)
  end

  def self.parse_all(results)
    objects = []
    results.each do |result|
      objects << self.new(result)
    end
    objects
  end

  def self.find(id)
    result = DBConnection.execute(<<-SQL, id)
      SELECT * FROM #{self.table_name}
      WHERE id = ?
    SQL
    return nil if result.empty?
    self.new(result.first)
  end

  def initialize(params = {})
    cols = params.keys
    db_columns = self.class.columns
    # vals = params.values
    cols.each do |col|
      raise "unknown attribute '#{col}'" unless db_columns.include?(col.to_sym)
      self.send("#{col.to_sym}=",params[col])
    end
  end

  def attributes
    @attributes ||= {}
  end

  def attribute_values
    attributes.values
  end

  def insert
    params_values = [nil]+@attributes.values
    num_of_args = @attributes.count+1
    passed_params = (["?"]*num_of_args).join(", ")

    DBConnection.execute(<<-SQL, *params_values)
      INSERT INTO #{self.class.table_name}
      VALUES (#{passed_params})
    SQL

    last_id = DBConnection.instance.last_insert_row_id
    @attributes[:id] = last_id
    self.send("id=",last_id)
  end

  def update
    params_values = @attributes.values.drop(1) #we don't want to update the id column
    row_id = @attributes.values.first
    num_of_args = params_values.count
    set_line_arguments = self.class.columns.map do |col|
      "#{col} = '#{@attributes[col]}'"
    end
    set_line = set_line_arguments.drop(1).join(", ") #again, we don't want to update the id column
    byebug
    DBConnection.execute(<<-SQL, row_id)
      UPDATE #{self.class.table_name}
      SET #{set_line}
      WHERE id = ?
    SQL
  end

  def save
    # byebug
    attributes.empty? ? insert : update
  end
end
