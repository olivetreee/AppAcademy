require "byebug"

# MyHashSet
#
# Ruby provides a class named `Set`. A set is an unordered collection of
# values with no duplicates.  You can read all about it in the documentation:
#
# http://www.ruby-doc.org/stdlib-2.1.2/libdoc/set/rdoc/Set.html
#
# Let's write a class named `MyHashSet` that will implement some of the
# functionality of a set. Our `MyHashSet` class will utilize a Ruby hash to keep
# track of which elements are in the set.  Feel free to use any of the Ruby
# `Hash` methods within your `MyHashSet` methods.
#
# Write a `MyHashSet#initialize` method which sets an empty hash object to
# `@store`. Next, write an `#insert(el)` method that stores `el` as a key
# in `@store`, storing `true` as the value. Write an `#include?(el)`
# method that sees if `el` has previously been `insert`ed by checking the
# `@store`; return `true` or `false`.
#
# Next, write a `#delete(el)` method to remove an item from the set.
# Return `true` if the item had been in the set, else return `false`.  Add
# a method `#to_a` which returns an array of the items in the set.
#
# Next, write a method `set1#union(set2)` which returns a new set which
# includes all the elements in `set1` or `set2` (or both). Write a
# `set1#intersect(set2)` method that returns a new set which includes only
# those elements that are in both `set1` and `set2`.
#
# Write a `set1#minus(set2)` method which returns a new set which includes
# all the items of `set1` that aren't in `set2`.

class MyHashSet

  def initialize
    @store = {}
  end

  def insert(el)
    @store[el] = true
  end

  def include?(el)
    @store.keys.include?(el)
  end

  def delete(el)
    return @store.delete(el).nil? ? false : true
  end

  def to_a
    @store.keys
  end

  def union(set2)
    new_set = MyHashSet.new
    self.to_a.each { |key| new_set.insert(key) }
    set2.to_a.each { |key| new_set.insert(key) }
    new_set
  end

  def intersect(set2)
    new_set = MyHashSet.new
    self.to_a.each do |key|
      new_set.insert(key) if set2.include?(key)
    end
    new_set
  end

  def minus(set2)
    new_set = MyHashSet.new
    self.to_a.each do |key|
      new_set.insert(key) unless set2.include?(key)
    end
    new_set
  end

  def symmetric_difference(set2)
    new_set = MyHashSet.new
    union_set = self.union(set2)
    intersect_set = self.intersect(set2)
    new_set = union_set.minus(intersect_set)
  end

  def ==(object)
    # RETURNING ERROR
    return false unless object.is_a?(MyHashSet)
    return false unless to_a.length == object.to_a.length
    self.minus(object).to_a.length == 0
  end

end

# Bonus
#
# - Write a `set1#symmetric_difference(set2)` method; it should return the
#   elements contained in either `set1` or `set2`, but not both!
# - Write a `set1#==(object)` method. It should return true if `object` is
#   a `MyHashSet`, has the same size as `set1`, and every member of
#   `object` is a member of `set1`.
