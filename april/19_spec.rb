require 'rspec'

describe DynamicContent do
  before do
    @base_content = {
      "1:1:baseball" => "Some baseball content",
      "2:1:football" => "Some football content",
      "3:2:baseball" => "Some more baseball content",
    }
  end

  it 'can render content into a single string' do
    dc = DynamicContent.new(@base_content)
    expect(dc.content_renderer).to eq("Some baseball content\nSome football content\nSome more baseball content\n")
  end

  it 'can dynamically new content items into the rendered string' do
    dc = DynamicContent.new(@base_content)
    dc.content_injector('1', 'baseball', 'New baseball content')
    expect(dc.content_renderer).to eq("Some baseball content\nNew baseball content\nSome football content\nSome more baseball content\n")
  end
end

