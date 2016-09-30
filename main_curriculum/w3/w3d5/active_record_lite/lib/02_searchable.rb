require 'byebug'
require_relative 'db_connection'
require_relative '01_sql_object'

module Searchable
  def where(params)
    #grab the params keys as cols
    #grab the params values as the values to be looked for

    col_names = params.keys
    query_paramaters = col_names.map do |col|
      "#{col}='#{params[col]}'"
    end
    query = query_paramaters.join(" AND ")
    results = DBConnection.execute(<<-SQL)
      SELECT * FROM #{self.table_name}
      WHERE #{query}
    SQL
    
    results.map {|result| self.new(result)}
  end
end

class SQLObject
  extend Searchable
end
