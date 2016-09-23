class PolyTreeNode
  attr_accessor :children,:value
  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end
  def parent
    @parent
  end
  def children
    @children
  end
  def value
    @value
  end
  def parent=(parent)
    if self.parent #exists
      @parent.children.delete(self)
    end
    @parent = parent
    unless parent== nil
      @parent.children << self unless @parent.children.include?(self)
    end
  end
  def add_child(child_node)
    @children << child_node
    child_node.parent = self
  end
  def remove_child(child)
    raise "not my kid" unless @children.include?(child)
    @children.delete(child)
    child.parent = nil
  end

  def dfs(target_value)
    return self if self.value == target_value
    @children.each do |child|
      wanted = child.dfs(target_value)
      unless wanted.nil?
        return wanted if wanted.value == target_value
      end
    end
    nil
  end

  def bfs(target_value)
    queue = [self]
    until queue.empty?
      node = queue.shift
      return node if node.value == target_value
      queue += node.children
    end
    nil
  end
end
