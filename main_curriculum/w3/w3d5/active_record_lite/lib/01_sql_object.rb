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
    # ...
  end

  def self.parse_all(results)
    # ...
  end

  def self.find(id)
    # ...
  end

  def initialize(params = {})
    # self.class.finalize!
  end

  def attributes
    @attributes ||= {}
  end

  def attribute_values
    # ...
  end

  def insert
    # ...
  end

  def update
    # ...
  end

  def save
    # ...
  end
end
