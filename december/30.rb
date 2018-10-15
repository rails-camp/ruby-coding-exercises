require 'rspec'

class Hash
 def param_converter
  # self.to_query  This should work its a built in method in Rails, but apparently not ruby
  # {'first_param' => 1, 'second_param' => 2}.to_query
  # => "first_param=1&second_param=2"
  self.map { |i| i * "=" }.join("&")
 end
end

describe 'HTML Param Converter' do
  it 'Adds an HTML param converter to the Hash class' do
    hash = { :topic => "baseball", :team => "astros" }
    expect(hash.param_converter).to eq('topic=baseball&team=astros')
  end
end

