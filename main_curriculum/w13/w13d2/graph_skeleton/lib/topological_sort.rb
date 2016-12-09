require_relative 'graph'
require 'byebug'

# Implementing topological sort using both Khan's and Tarian's algorithms

def topological_sort(vertices)
  top_level = []
  sorted = []
  in_edges_count = {}

  # Grabs all vertices without an in_edge (top_level vertices)
  # At this point, it should only be the root node
  vertices.each do |node|
    top_level << node if node.in_edges.empty?
    in_edges_count[node] = node.in_edges.count
  end

  until top_level.empty?
    # Grab a node from the top_level, remove it from the graph and add it to sorted
    current_node = top_level.pop
    sorted << current_node
    vertices.delete(current_node)

    current_node.out_edges.each do |edge|
      destination_node = edge.to_vertex
      # edge.destroy! Can't destroy the edge since it will break the each loop. Need an edges counter
      in_edges_count[destination_node] -= 1
      top_level << destination_node if in_edges_count[destination_node] == 0 # If we just deleted the last in_edge of a node, it became a top_level node.
    end

  end

  sorted

end
