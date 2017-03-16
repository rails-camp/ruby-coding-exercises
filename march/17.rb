require 'rspec'

describe 'File selector' do
  it 'converts an array of file names into a hash where each file type is the key and the name(s) are in an array for the value' do
    file_names = %w{file1.rb file2.html file3.rb file4.rb file5.js}
    expect(file_names.file_type_mapper).to eq({
                                              'rb' => ['file1', 'file3', 'file4'],
                                              'html' => ['file2'],
                                              'js' => ['file5']
                                              })
  end
end

