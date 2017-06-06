require 'rspec'

class ContentSorter
  def initialize(str)
    @delimiters = %w{. , ;}
    @str = str
  end

  def shuffled_content
    section = []

    split_array = @str.chars.each_with_object([]) do |element, arr|
      section << element
      if @delimiters.include?(element) && section.count >= 20
        arr << section.join
        section.clear
      end
    end

    split_array.shuffle
  end
end

describe ContentSorter do
  it 'shuffles text based content and splits it by section length and delimiters' do
    content = <<~EOL
      Chuck Norris doesn't delete files, he blows them away.
      Chuck Norris' addition operator doesn't commute; it teleports to where he needs it to be.
      Chuck Norris doesn't have performance bottlenecks. He just makes the universe wait its turn.
      Whiteboards are white because Chuck Norris scared them that way.
      No statement can catch the ChuckNorrisException.
      Chuck Norris can recite π. Backwards.
      When Chuck Norris gives a method an argument, the method loses.
      Chuck Norris's first program was kill -9.
      Chuck Norris doesn't get compiler errors, the language changes itself to accommodate Chuck Norris.
    EOL

    srand 1
    sc = ContentSorter.new(content.gsub("\n", '')).shuffled_content

    expected_result = ["Chuck Norris' addition operator doesn't commute;", " it teleports to where he needs it to be.", "Chuck Norris doesn't have performance bottlenecks.", " the method loses.Chuck Norris's first program was kill -9.", " he blows them away.", "Whiteboards are white because Chuck Norris scared them that way.", "Chuck Norris doesn't delete files,", "No statement can catch the ChuckNorrisException.", " the languagechanges itself to accommodate Chuck Norris.", " Backwards.When Chuck Norris gives a method an argument,", "Chuck Norris can recite π.", "Chuck Norris doesn't get compiler errors,", " He just makes the universe wait its turn."]

    expect(sc).to eq(expected_result)
  end
end
