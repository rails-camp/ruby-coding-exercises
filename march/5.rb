require 'rspec'

describe 'Duplicating objects' do
  it 'clones an string and maintains the same object_id assuming that the string is identical' do
    str_array = ['some word', 'some word', 'some word']
    cloned_array = duplicate_objects str_array
    expect(cloned_array.first.object_id).to eq(cloned_array.last.object_id)
  end
end

