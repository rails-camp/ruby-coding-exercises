require 'rspec'

describe 'Breadcrumb generator' do
  it 'converts an array of strings to breadcrumb' do
    items = ['String 1', 'String 2', 'String 3']
    expect(breadcrumb_generator items).to eq('String 1 / String 2 / String 3')
  end
end

