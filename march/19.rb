require 'rspec'

def append_js_file_extension required_files
  required_files.map do |file|
    file.gsub(/\/\/= require /, '')
  end.map do |f|
    f + '.js'
  end
end

describe 'JavaScript file extension' do
  it 'converts require statements to javascript file name' do
    javascript_files = [
      '//= require custom/scripts',
      '//= require base/defaults',
      '//= require html.sortable',
      '//= require moment',
      '//= require test-styles'
    ]
    expect(append_js_file_extension javascript_files).to eq([
                                                              'custom/scripts.js',
                                                              'base/defaults.js',
                                                              'html.sortable.js',
                                                              'moment.js',
                                                              'test-styles.js'
                                                            ])
  end
end
