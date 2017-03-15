require 'rspec'

describe 'File selector' do
  it 'returns the ruby file names from an array of file names' do
    file_names = %w{file1.rb file2.html file3.rb file4.rb file5.js}
    expect(file_names.file_selector 'rb').to eq(['file1', 'file3', 'file4'])
  end
end

