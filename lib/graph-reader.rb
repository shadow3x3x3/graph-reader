require_relative 'helper/read_helper'
require_relative 'structure/edge'

module GraphReader
  class Graph
    include ReadHelper

    attr_accessor :edges, :nodes, :adj_matrix

    def initialize(edge_path)
      raise ArgumentError, "expect (String), got #{edge_path.class}" unless edge_path.instance_of? String
      @nodes = []
      @edges = []
      
      init_edges(edge_path)
      @edges_hash = set_edges_hash

      @adj_map = {}
      set_adj_map(@adj_map)

      @adj_matrix = init_adj_matrix(@nodes.size)
      set_adj_matrix(@adj_matrix)
      @dim = @edges.first.attrs.size
    end

    def add_node(node)
      @nodes << node unless @nodes.include?(node)
    end

    def add_edge(edge)
      new_edge = Edge.new(edge)
      unless duplicate_edge?(new_edge)
        @edges << new_edge
        add_node(new_edge.src)
        add_node(new_edge.dst)
      end
    end

    def set_edges_hash
      e_hash = {}
      @edges.each do |edge|
        e_hash[[edge.src, edge.dst]] = edge
        e_hash[[edge.dst, edge.src]] = edge
      end
      e_hash
    end

    def set_adj_map(adj_map)
      adj_pos = 0
      @nodes.each do |n| 
        adj_map[n] = adj_pos
        adj_pos += 1
      end 
    end

    def init_adj_matrix(size)
      Array.new(size) { Array.new(size, 0) }
    end

    def set_adj_matrix(adj_matrix)
      @edges.each do |e|
        adj_matrix[@adj_map[e.src]][@adj_map[e.dst]] = 1
        adj_matrix[@adj_map[e.dst]][@adj_map[e.src]] = 1
      end
    end

    def duplicate_edge?(new_edge)
      @edges.each { |edge| return true if same_edge?(edge, new_edge) }
      false
    end

    def same_edge?(edge1, edge2)
      edge1_src_id = edge1.src
      edge1_dst_id = edge1.dst
      edge2_src_id = edge2.src
      edge2_dst_id = edge2.dst
      return true if edge1_src_id == edge2_src_id && edge1_dst_id == edge2_dst_id
      return true if edge1_dst_id == edge2_src_id && edge1_src_id == edge2_dst_id
      false
    end
  end
end
