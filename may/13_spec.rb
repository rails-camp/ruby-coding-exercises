require 'rspec'

describe 'censor vs censor!' do
  it 'takes in an argument and a word to censor and replaces the word with CENSORED' do
    sentence_one = 'The quick brown fox jumped over the lazy dog'
    sentence_two = 'The quick brown fox jumped over the lazy dog'
    censor!(sentence_one, 'fox')
    expect(sentence_one).to eq('The quick brown CENSORED jumped over the lazy dog')
    expect(censor(sentence_two, 'dog')).to eq('The quick brown fox jumped over the lazy CENSORED')
  end

  it 'permanently changes the word when the bang version is used' do
    sentence = 'The quick brown fox jumped over the lazy dog'
    censor!(sentence, 'fox')
    expect(sentence).to eq('The quick brown CENSORED jumped over the lazy dog')
  end

  it 'only returns the updated value, but does not change the original object with the non bang version' do
    sentence = 'The quick brown fox jumped over the lazy dog'
    censor(sentence, 'fox')
    expect(sentence).to eq('The quick brown fox jumped over the lazy dog')
  end
end
