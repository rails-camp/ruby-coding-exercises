require 'rspec'

class FileWriter
  def initialize(number_of_lines:, file_path:)
    @path = file_path
    @n = number_of_lines
  end

  def write
    File.open(@path, 'w+') do |f|
      @n.times do |i|
        f.puts "Content line #{i + 1}"
      end
    end
  end
end

describe FileWriter do
  it 'writes 1k lines to a text file' do
    file_path = 'support/file_writer.txt'

    fw = FileWriter.new(
      number_of_lines: 1000,
      file_path: file_path
    ).write

    count = File.foreach(file_path).count
    expect(count).to eq(1000)
  end
end
