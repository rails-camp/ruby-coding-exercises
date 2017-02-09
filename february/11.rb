require 'rspec'

def state_sorter states
end

describe 'State Data Sorter' do
  it 'properly sorts an array of states, even when the elements contain additional preceding values' do
    states = ['- AZ', 'KY', '* FL', '-- AR']
    expect(state_sorter(states).first).to eq('-- AR')
    expect(state_sorter(states).last).to eq('KY')
  end
end

