require 'rspec'

describe 'Generate all binary strings from given pattern' do
  it 'returns an array of strings with all of the potential permutations of the question mark elements filled in with 0 or 1' do
    binary_swapper = BinarySwapper.new(binary_string: "1??0?101")

    expect(binary_swapper.binary_question_mark_filler).to eq( [
                                                      '10000101',
                                                      '10001101',
                                                      '10100101',
                                                      '10101101',
                                                      '11000101',
                                                      '11001101',
                                                      '11100101',
                                                      '11101101'
                                                    ])
  end

  it 'works on binary strings of different sizes' do
    binary_swapper = BinarySwapper.new(binary_string: "01??")

    expect(binary_swapper.binary_question_mark_filler).to eq( [
                                                      '0100',
                                                      '0101',
                                                      '0110',
                                                      '0111'
                                                    ])
  end
end

