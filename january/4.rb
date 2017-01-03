require 'rspec'

class ContentController
  def initialize(word)
    @word = word
  end

  def hidden_content
    @word.commentize
  end
end

describe 'Refining Strings for a specific module' do
  it 'changes the behavior of the String method to make it render as a comment' do
    cc = ContentController.new("My String")
    expect(cc.hidden_content).to eq("# My String")
  end
end

