require 'rspec'  # => true

class Array
  def remove_duplicates
    self.each_with_object([]) do |e, arr|
      arr << e unless arr.include?(e)
    end
  end                                      # => :remove_duplicates
end                                        # => :remove_duplicates

describe 'Duplicate removal' do
  it 'Removed duplicates from an array' do
    arr = [1, 3, 4, 1, 4]
    expect(arr.remove_duplicates).to eq([1, 3, 4])
  end                                               # => #<RSpec::Core::Example "Removed duplicates from an array">
end                                                 # => RSpec::ExampleGroups::DuplicateRemoval
