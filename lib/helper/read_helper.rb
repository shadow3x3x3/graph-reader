# Reading raw file module
module ReadHelper
  def init_edges(edge_path)
    adding_edges(File.read(edge_path))
  end

  def adding_edges(raw_edges)
    raw_edges.each_line do |edge|
      edge = edge.split.map!(&:to_f)
      add_edge(edge)
    end
  end
end
