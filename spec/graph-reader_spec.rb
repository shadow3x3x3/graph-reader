require_relative 'spec_helper'

TEST_ADD_EDGE = %q(
   9 7 1 0 0
)

describe GraphReader do
  it 'has a version number' do
    expect(GraphReader::VERSION).not_to be nil
  end
end

describe GraphReader::Graph do
  let(:g) { GraphReader::Graph.new("spec/TEST_EDGES.txt") }
end
