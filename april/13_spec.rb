require 'rspec'

def number_lines(path)
  File.read(path).split("\n").each_with_index do |line, idx|
    File.open('support/april_13_numbered_lines.txt', 'a') do |f|
      f.puts "#{idx + 1}. #{line}"
    end
  end
end

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
