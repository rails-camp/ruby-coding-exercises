require 'rspec'

module RubyContent
  refine String do
    def commentize
      "# #{self}"
    end
  end
end

module HtmlContent
  refine String do
    def commentize
      "<!-- #{self} -->"
    end
  end
end

class ContentController
  using RubyContent

  def initialize(word)
    @word = word
  end

  def hidden_content
    @word.commentize
  end
end

class HtmlController
  using HtmlContent

  def initialize(word)
    @word = word
  end

  def hidden_content
    @word.commentize
  end
end


cc = ContentController.new("My String")
cc.hidden_content

html = HtmlController.new("My Html Content")
html.hidden_content

describe 'Refining Strings for a specific module' do
  it 'changes the behavior of the String method to make it render as a comment' do
    cc = ContentController.new("My String")
    expect(cc.hidden_content).to eq("# My String")
  end
end

