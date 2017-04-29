require 'rspec'

class Hash
  def randomizer
    random_keys = self.keys.shuffle
    random_values = self.values.shuffle
    random_keys.each_with_object(Hash.new) do |key, hash|
      hash[key] = random_values.pop
    end
  end
end

describe 'randomizer' do
  it 'can randomize the key and value mappings in a hash' do
    srand 1
    hash = {
      'key_one' => 'value_one',
      'key_two' => 'value_two',
      'key_three' => 'value_three',
      'key_four' => 'value_four',
      'key_five' => 'value_five'
    }
    expect(hash.randomizer).to eq({
      "key_three"=>"value_two",
      "key_two"=>"value_four",
      "key_five"=>"value_five",
      "key_one"=>"value_three",
      "key_four"=>"value_one"
    })
  end
end
