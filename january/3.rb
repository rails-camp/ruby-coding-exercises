require 'rspec'

class String

  def total_words
    array = self.gsub(/[^a-zA-Z]/, " ").split(" ")
    array.length
  end

  def word_list
    result = Hash.new(0)
    array = self.gsub(/[^a-zA-Z]/, " ").split(" ")
    array.each do |word| 
      result[word] += 1 
    end
    result
  end

end

describe 'Word Reporter' do
  before do
    @str = "- the quick brown fox / jumped over the lazy fox."
  end

  it 'Counts words accurately' do
    expect(@str.total_words).to eq(9)
  end

  it 'Returns a hash that totals up word usage' do
    expect(@str.word_list).to eq({"the"=>2,
                                  "quick"=>1,
                                  "brown"=>1,
                                  "fox"=>2,
                                  "jumped"=>1,
                                  "over"=>1,
                                  "lazy"=>1}
                                )
  end
end

