require 'byebug'
require_relative '02_searchable'
require 'active_support/inflector'

# Phase IIIa
class AssocOptions
  attr_accessor(
    :foreign_key,
    :class_name,
    :primary_key
  )

  def model_class
    self.class_name.constantize
  end

  def table_name
    self.class_name == "Human" ? "humans" : self.class_name.tableize
  end
end

class BelongsToOptions < AssocOptions
  def initialize(name, options = {})
    self.class_name = options[:class_name] || name.to_s.camelcase
    self.primary_key = options[:primary_key] || :id
    self.foreign_key = options[:foreign_key] || "#{name}_id".to_sym
  end
end

class HasManyOptions < AssocOptions
  def initialize(name, self_class_name, options = {})
    self.class_name = options[:class_name] || name.camelcase.singularize
    self.primary_key = options[:primary_key] || :id
    self.foreign_key = options[:foreign_key] || "#{self_class_name.downcase}_id".to_sym
  end
end

module Associatable
  # Phase IIIb
  def belongs_to(name, options = {})
    options = BelongsToOptions.new(name, options)
    define_method(name) do
      
    end
  end

  def has_many(name, options = {})
    # ...
  end

  def assoc_options
    # Wait to implement this in Phase IVa. Modify `belongs_to`, too.
  end
end

class SQLObject
  extend Associatable
end
