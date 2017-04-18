require 'rspec'

describe 'clean_merge' do
  it 'does not overwrite data for duplicate keys' do
    data_one = { left_field:  100, right_field: 200 }
    data_two = { right_field: 254, short_stop: 300 }
    expect(clean_merge(data_one, data_two)).to eq({:left_field=>100, :right_field=>200, :short_stop=>300, "dup_right_field"=>254})
  end
end
