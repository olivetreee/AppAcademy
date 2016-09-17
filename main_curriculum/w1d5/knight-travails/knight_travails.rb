require_relative "lib/00_tree_node"

class KnightPathFinder
  attr_reader :start_node
  def initialize(start_pos)
    @start_node = PolyTreeNode.new(start_pos)
    @visited_positions = [@start_pos]
    @child_nodes = []
  end

  def self.valid_moves(start_pos)
    start_x,start_y = start_pos
    possible_increments = [
    [-2,1],
    [-2,-1],
    [2,-1],
    [2,1],
    [1,-2],
    [-1,-2],
    [-1,2],
    [1,2]]
    possible_positions = []
    possible_increments.each do |increment|
      possible_positions << [start_x+increment.first,start_y+increment.last]
    end
    possible_positions.select {|position| valid_position?(position)}
  end

  def self.valid_position?(pos)
    pos.each do |coordinate|
      return false if coordinate < 0 || coordinate >= 8
    end
    true
  end

  def new_move_positions(pos)
    all_positions = KnightPathFinder.valid_moves(pos)
    remains = all_positions.reject {|position| @visited_positions.include?(position)}
    @visited_positions+=remains
    remains
  end

  def tree_bfs
    queue = [@start_node]
    until queue.empty?
      node = queue.shift
      start_pos = node.value
      new_moves = new_move_positions(start_pos)
      next if new_moves.empty?
      new_moves.each do |move|
        child =  PolyTreeNode.new(move)
        child.parent = node
        #node.children << child
        queue << child
      end
    end
  end

  def find_path(end_position)
    # return target_node if target_node.value == end_position
    target_node = @start_node.dfs(end_position)
    return "no path found" if target_node.nil?
    current_node = target_node
    path = [current_node.value]
    until current_node.parent.nil?
      path << current_node.parent.value
      current_node = current_node.parent
    end
    path.reverse
  end
end

a = KnightPathFinder.new([0,0])
a.tree_bfs
# a.start_node.children.each {|child| p child.value}
p a.find_path([7,6])
