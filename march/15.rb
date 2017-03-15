require 'rspec'

class Array
  def remove_anomalies low, high
    reject { |e| e < low }.reject { |e| e > high }
  end
end

describe 'Remove anomalies' do
  it 'Removes all values above and below specified values' do
    amounts = [44, 8043, 443, 43452, 2183]
    expect(amounts.remove_anomalies 100, 10_000).to eq([8043, 443, 2183])
  end
end
