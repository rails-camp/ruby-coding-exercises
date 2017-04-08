require 'rspec'

describe 'Find largest word in dictionary by deleting some characters of given string' do
  it 'return apple for a string of abpcplea' do
    word_to_clean = 'abpcplea'
    words = %w{ale apple monkey plea}
    expect(largest_hidden_word(words, word_to_clean)).to eq('apple')
  end

  it 'return devcamp for a string of dbenvcadmep' do
    word_to_clean = 'dbenvcadmep'
    words = %w{devcamp devcampdevcamp notamatch devsomething}
    expect(largest_hidden_word(words, word_to_clean)).to eq('devcampdevcamp')
  end
end

