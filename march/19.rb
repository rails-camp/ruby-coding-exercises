require 'rspec'

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

