# Record Edge
class Edge
  attr_accessor :id, :src, :dst, :attrs

  def initialize(params)
    @id    = params.shift.to_i
    @src   = params.shift.to_i
    @dst   = params.shift.to_i
    @attrs = params
  end
end
