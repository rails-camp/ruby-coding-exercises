require 'rspec'

def route_generator route_total, nodes
  route_total.to_f / nodes.inject(0) { |total, node| total += node.last }
end

describe 'Graph weight analyzer' do
  it 'calculates the value of weight in a mapping application' do
    nodes = [[1, 3], [2, 3], [3, 4]]
    expect(route_generator 15, nodes).to eq(1.5)
  end
end
