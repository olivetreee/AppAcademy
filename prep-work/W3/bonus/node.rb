# require_relative 'maze-solver'

class Node

  PATH_WEIGHTS = {
    v: 10,
    h: 10,
    d: 14
  }

	attr_accessor :g_weight, :h_weight, :next, :parent
  attr_reader :position, :f_weight

	def initialize(position, maze)
    @position = position
    # @maze = maze
    @g_weight = calculate_weights(position,maze)[:g]
    @h_weight = calculate_weights(position,maze)[:h]
    @f_weight = @g_weight + @h_weight
    @next = nil
    @parent = maze.current_node
	end

  def calculate_weights(position,maze)
    end_position = maze.end_position
    current_node = maze.current_node
    weights = {}

    weights[:h] = calculate_h_weight(position, end_position)
    weights[:g] = calculate_g_weight(position, current_node)

    weights
  end

  def calculate_h_weight(position, end_position)
    v_end_diff = (position.first - end_position.first).abs
    h_end_diff = (position.last - end_position.last).abs
    v_end_diff * PATH_WEIGHTS[:v] + h_end_diff * PATH_WEIGHTS[:h]
  end

  def calculate_g_weight(position, current_node)
    #For the start node
    if current_node.nil?
      return 0
    else
      current_position = current_node.position
      current_g_weight = current_node.g_weight
      v_current_diff = (position.first - current_position.first).abs
      h_current_diff = (position.last - current_position.last).abs
      if v_current_diff == 0 #adj_node and @current_node on same row
        return current_g_weight + PATH_WEIGHTS[:h]
      elsif h_current_diff == 0 #adj_node and @current_node on same col
        return current_g_weight + PATH_WEIGHTS[:v]
      else #adj_node is on diagonal of @current_node
        return current_g_weight + PATH_WEIGHTS[:d]
        #The diff will never be [0,0] since this was checked on find_adjacent_positions
      end
    end
  end

  def update_node(new_g, new_parent)
    @g_weight = new_g
    @f_weight = @g_weight + @h_weight
    @parent = new_parent
  end

end

=begin

#creating nodes
node_1 = Node.new("A")
node_2 = Node.new("B", node_1)
node_3 = Node.new("C", node_2)

node_1.next = node_2
node_2.next = node_3

#Now you have something like this
#("A") -> ("B") -> ("C") -> nil

#the first node is called the head, and the last node is called the tail typically

#to search through nodes
def node_search(head)
	current_node = head
	str = ""
	until current_node.nil?
		str << "(#{current_node.value})->"
		node = node.next
	end

	puts str << "nil"
end

node_search(node_1) #=> (A)->(B)->(C)->nil
node_search(node_2) #=> (B)->(C)->nil
=end
