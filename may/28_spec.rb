require 'rspec'

def remove_first_and_last(arr)
end

describe '.remove_first_and_last' do
  it 'removes the first and last elements from an array and returns any elements in the middle of the collection' do
    html = ['<h1>', 'My content', '</h1>']
    expect(remove_first_and_last(html)).to eq(['My content'])

    other_content_to_clean = ['', 'My content', 'Something else', '/']
    expect(remove_first_and_last(other_content_to_clean)).to eq(['My content', 'Something else'])
  end

  it 'raises an error if 2 or fewer items are passed to the method' do
    too_small_array = ['something', 'else']
    expect { remove_first_and_last(too_small_array) }.to raise_error(/At least three elements are needed in the array/)
  end
end
