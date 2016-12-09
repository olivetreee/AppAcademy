require_relative 'graph'
require_relative 'priority_map'

# O(|V| + |E|*log(|V|)).
def dijkstra2(source_node)

  shortest_paths = {}
  possible_paths = PriorityMap.new do |node1_data, node2_data|
    node1_data[:cost] <=> node2_data[:cost]
  end

  possible_paths[source_node] = {cost: 0, previous: nil}

  until possible_paths.empty?
    current_node, node_data = possible_paths.extract
    shortest_paths[current_node] = node_data

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
