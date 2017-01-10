require 'rspec'

class String
  def alt_reverse
    reversed_string = ""
    string_length = self.length - 1

    string_length.downto(0).each do |l|
      reversed_string << self[l]
    end

    reversed_string
  end
end

describe 'Letter reversing' do
  it 'reverses the letters of a string without using the reverse method' do
    expect("Hi there".alt_reverse).to eq("ereht iH")
  end
end

