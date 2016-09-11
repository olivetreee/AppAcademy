require_relative 'node'
require_relative 'grid'

require 'byebug'

class MazeRunner

  attr_reader :end_position, :current_position, :current_node, :open_list, :maze

  def initialize(file_name = get_file_name)
    @maze = file_to_grid(file_name)
    @non_walkables = find_positions_from("*")
    @start_position = find_positions_from("S")
    @end_position = find_positions_from("E")
    @nodes_positions = create_nodes_array
    # @current_position = @start_position
    @open_list = []
    @closed_list = []
    @current_node = Node.new(@start_position, self)
  end

  def solve_maze
    #get adjacent positions
    #get adjacent nodes
    #move to closed list
    #add/maintain open list
    #sort open list
    #grab smallest F from open list
    while true
      adjacent_positions = find_adjacent_positions
      adjacent_nodes = get_adjacent_nodes(adjacent_positions)
      break if adjacent_nodes == "EXIT"
      current_node_to_closed_list(@current_node)
      maintain_open_list(adjacent_nodes)
      @current_node = find_next_node
      # print_solution
    end
    print_solution
  end


  def file_to_grid(file)
    lines = File.readlines(file)
    array = lines.map {|line| line.split("")}
    MazeGrid.new(array)
  end

  def get_file_name
    puts "Path to maze file:"
    gets.chomp
  end

  def find_next_node
    raise "Looks like you'll die in this place..." if @open_list.empty?
    sort_open_list
    @open_list[0]

  end

  def print_solution
    print_node = @current_node
    until print_node.parent.nil?
      @maze[*print_node.position] = "X"
      print_node = print_node.parent
    end
    @maze.grid.each {|row| puts row.join("")}
  end


  private

  def create_nodes_array
    nodes_array = @maze.dup
    nodes_array.erase_grid
    nodes_array
  end

  def find_positions_from(symbol)
    positions = []
    @maze.grid.each_with_index do |row,row_num|
      row.each_with_index do |node,col_num|
        positions << [row_num,col_num] if node == symbol
      end
    end
    positions.count == 1 ? positions.flatten : positions
  end

  def walkable?(position)
    is_positive_row = position[0] >= 0
    is_positive_col = position[1] >= 0
    is_wall = @non_walkables.include?(position)
    is_positive_row && is_positive_col && !is_wall
  end

  def find_adjacent_positions
    adj_positions = []
    (-1..1).each do |row_diff|
      (-1..1).each do |col_diff|
        next if row_diff == 0 && row_diff == col_diff #This would be @current_position
        adj_row = @current_node.position.first+row_diff
        adj_col = @current_node.position.last+col_diff
        adj_pos = [adj_row,adj_col]
        adj_positions << adj_pos if walkable?(adj_pos)
      end
    end
    adj_positions
  end

  def get_adjacent_nodes(positions)
    adj_nodes = []
    positions.each do |position|
      return "EXIT" if @maze[*position] == "E"
      create_new_node(position) unless node_exists?(position)
      adj_nodes << @nodes_positions[*position]
    end
    adj_nodes
  end

  def create_new_node(position)
    @nodes_positions[*position] = Node.new(position,self)
  end

  def node_exists?(position)
    !@nodes_positions[*position].nil?
  end

  def maintain_open_list(nodes)
    nodes.each do |node|
      next if on_closed_list?(node)

      if on_open_list?(node)
        check_g_weight(node)
      else
        @open_list << node
      end

    end
  end

  def on_open_list?(node)
    @open_list.include?(node)
  end

  def on_closed_list?(node)
    @closed_list.include?(node)
  end

  def sort_open_list
    @open_list.sort_by! {|node| node.f_weight}
  end

  def current_node_to_closed_list(new_node)
    @open_list.delete(@current_node)
    @closed_list << @current_node
  end

  def check_g_weight(node)
    current_g_weight = node.g_weight
    new_g_weight = node.calculate_g_weight(node.position,@current_node)
    if new_g_weight < current_g_weight
      node.update_node(new_g_weight,@current_node)
    end
  end


end

if __FILE__ == $PROGRAM_NAME
  file = "./mazes/maze2.txt"
  solver = MazeRunner.new(file)
  solver.solve_maze
  # solver.open_list.each {|node| p node}
end
