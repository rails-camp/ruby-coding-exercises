require 'rspec'

class Array
  def file_type_mapper
    each_with_object(Hash.new { |h, k| h[k] = [] }) do |file, hash|
      file_ext = File.extname(file)[1..-1]
      hash[file_ext] = hash[file_ext].push(file.chomp!('.' + file_ext))
    end
  end
end

describe 'File selector' do
  it 'converts an array of file names into a hash where each file type is the key and the name(s) are in an array for the value' do
    file_names = %w{file1.rb file2.html file3.rb file4.rb file5.js}
    expect(file_names.file_type_mapper).to eq({
                                              'rb' => ['file1.rb', 'file3.rb', 'file4.rb'],
                                              'html' => ['file2.html'],
                                              'js' => ['file5.js']
                                              })
  end
end
