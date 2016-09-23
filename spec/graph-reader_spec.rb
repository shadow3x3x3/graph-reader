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
  describe '#neighbor?' do
    context 'when nodes are 1, 2' do
      subject { g.neighbor?(1, 2) }
      it { should be true }
    end
    context 'when nodes are 1, 3' do
      subject { g.neighbor?(1, 3) }
      it { should be false }
    end
  end
end
