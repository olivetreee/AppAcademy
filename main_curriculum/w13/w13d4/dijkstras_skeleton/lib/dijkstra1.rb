require 'byebug'
require_relative 'graph'

# O(|V|**2 + |E|).
def dijkstra1(source_node)
  shortest_paths = {}
  possible_paths = {}
  possible_paths[source_node] = {cost: 0, previous: nil}

  until possible_paths.empty?
    current_node = get_lowest_cost_node(possible_paths)
    shortest_paths[current_node] = possible_paths[current_node]
    possible_paths.delete(current_node)

    current_node.out_edges.each do |edge|
      destination = edge.to_vertex

      new_cost = edge.cost + shortest_paths[current_node][:cost]

      # If I have the node on the possible_paths and the new_cost is bigger than the new cost, it doesn't make sense to update the cost. We only update it if:
      # • the node is not on possible_paths (hence, we initialize it) OR
      # • the new_cost is lower than the new cost

      if (!possible_paths.has_key?(destination) || new_cost < possible_paths[destination][:cost])
        possible_paths[destination] = {cost: new_cost, previous: current_node}
      end
    end
  end
  return shortest_paths
end

def get_lowest_cost_node(paths)
  costs = []
  paths.each do |path, value|
    costs.push(value[:cost])
  end
  min_cost = costs.min

  #Returns the key of the path with the minimum cost
  paths.select{|k,v| v[:cost] === min_cost}.keys[0]
end
