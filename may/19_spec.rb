require 'rspec'

def letter_hash_with_index(start_letter, end_letter)
end

describe 'letter_hash_with_index' do
  it 'generates a hash where the key is the index position of the letter and the value is the letter itself' do
    expected_hash = {0=>"A", 1=>"B", 2=>"C", 3=>"D", 4=>"E", 5=>"F", 6=>"G", 7=>"H", 8=>"I", 9=>"J", 10=>"K", 11=>"L", 12=>"M", 13=>"N", 14=>"O", 15=>"P", 16=>"Q", 17=>"R", 18=>"S", 19=>"T", 20=>"U", 21=>"V", 22=>"W", 23=>"X"}
    expect(letter_hash_with_index('A', 'X')).to eq(expected_hash)
  end

  it 'can work on any sequence of letters' do
    expected_hash = {0=>"g", 1=>"h", 2=>"i", 3=>"j", 4=>"k", 5=>"l", 6=>"m"}
    expect(letter_hash_with_index('g', 'm')).to eq(expected_hash)
  end
end

