require 'rspec'

def clean_merge h1, h2
  dup_keys = h2.keys.each_with_object([]) do |key, arr|
    arr << key if h1.keys.include? key
  end

  if dup_keys.count > 0
    h2.clone.map do |k, v|
      if dup_keys.include? k
        h2['dup_' + k.to_s] = h2.delete(k)
      end
    end
  end

  h1.merge(h2)
end

describe 'clean_merge' do
  it 'does not overwrite data for duplicate keys' do
    data_one = { left_field:  100, right_field: 200 }
    data_two = { right_field: 254, short_stop: 300 }
    expect(clean_merge(data_one, data_two)).to eq({:left_field=>100, :right_field=>200, :short_stop=>300, "dup_right_field"=>254})
  end
end

