require 'rspec'

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

