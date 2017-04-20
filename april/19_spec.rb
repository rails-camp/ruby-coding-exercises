require 'rspec'

class DynamicContent
  attr_reader :content

  def initialize(base_content)
    @content = base_content
  end

  def content_renderer
    @content.each_with_object("") do |(_, v), final_str|
      final_str << (v + "\n")
    end
  end

  def content_injector(tag_position, tag, str)
    content_array = @content.each_with_object([]) do |(k, v), arr|
      arr << k.split(':').push(v)
    end

    content_array.each { |e| e.shift }
    content_pointer = content_array.index { |i| i[0] == tag_position && i[1] == tag }.to_s.succ
    final_array = content_array.insert(content_pointer.to_i, [content_pointer, tag, str])
    @content = formatter(final_array)
  end

  def formatter(raw_content_array)
    raw_content_array.each_with_object(Hash.new).with_index do |(e, hash), idx|
      hash["#{idx}:#{e[0]}:#{e[1]}"] = e[2]
    end
  end
end

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
