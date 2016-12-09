require 'byebug'
require_relative 'graph'

# O(|V|**2 + |E|).
def dijkstra1(source_node)
  shortest_paths = {}
  shortest_paths[:source_node] = {cost: 0, previous: nil}
  possible_paths = [source_node]

  until possible_paths.empty?
    current_node = extract_lowest_cost(possible_paths)
    possible_paths.delete(current_node)

    current_node.out_edges.each do |edge|
      destination = edge.to_vertex
      possible_paths << destination
      shortest_paths[:destination] = {cost: 0, previous: nil}

      new_cost = edge.cost + current_node.cost
      if (destination.cost > 0 && new_cost < destination.cost)
        shortest_paths[:destination] = {cost: new_cost, previous: current_node}
      end
    end
  end
  return shortest_paths
end

def extract_lowest_cost(paths)
  costs = []
  byebug
  paths.each do |path|
    byebug
    costs.push(path[:cost])
  end
  min_cost = costs.min

  #Returns the key of the path with the minimum cost
  paths.select{|k,v| v[:weight] === min_cost}.keys[0]
end
