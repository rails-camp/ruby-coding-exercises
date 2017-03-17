require 'rspec'

javascript_files = [
  '//= require custom/scripts',
  '//= require base/defaults',
  '//= require html.sortable',
  '//= require moment',
  '//= require test-styles'
]

def append_js_file_extension required_files
  required_files.map do |file|
    file.gsub(/\/\/= require /, '')
  end.map do |f|
    f + '.js'
  end
end

append_js_file_extension javascript_files

describe 'JavaScript file extension' do
  it 'converts require statements to javascript file name' do
    expect(append_js_file_extension javascript_files).to eq([
                                                              'custom/scripts.js',
                                                              'base/defaults.js',
                                                              'html.sortable.js',
                                                              'moment.js',
                                                              'test-styles.js'
                                                            ])
  end
end
