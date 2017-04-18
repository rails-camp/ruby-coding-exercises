require 'rspec'

describe 'number_lines' do
  it 'adds numbers to each line number of a file' do
    begin
      %x{rm support/april_13_numbered_lines.txt}
    rescue
    end
    path = 'support/april_13_lines.txt'
    number_lines(path)
    expect(File.read('support/april_13_numbered_lines.txt')).to eq(File.read('support/april_13_solution.txt'))
  end
end

