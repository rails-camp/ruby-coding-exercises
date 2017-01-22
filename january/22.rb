require 'rspec'

class String
  def integer? 
    return true if self =~ /^[1-9]\d*(\.\d+)?$/
    false
  end
end

module Tippy

  class Builder
    def initialize total:, gratuity:
      @total = total
      @gratuity = gratuity
    end

    def generate
      return calculation if number_based?
      string_based
    end

    def number_based?
      (@gratuity.is_a? Numeric) || (@gratuity.integer?)
    end

    def string_based
      case @gratuity.downcase
      when 'high'     then calculation 25
      when 'standard' then calculation 18
      when 'low'      then calculation 15
      end
    end

    def calculation gratuity = @gratuity
      @total += @total * (gratuity.to_f / 100)
    end
  end

end

describe 'Tip Generator' do
  it 'Accurately generates a tip given string or integer input' do
    test_1 = Tippy::Builder.new(total: 100, gratuity: '23.5').generate
    test_2 = Tippy::Builder.new(total: 100, gratuity: 'high').generate
    test_3 = Tippy::Builder.new(total: 100, gratuity: 'LOW').generate
    test_4 = Tippy::Builder.new(total: 100, gratuity: 'standard').generate
    test_5 = Tippy::Builder.new(total: 100, gratuity: '18').generate
    test_6 = Tippy::Builder.new(total: 100, gratuity: 20).generate
    test_7 = Tippy::Builder.new(total: 100, gratuity: 0).generate

    expect(test_1).to eq(123.5)
    expect(test_2).to eq(125.0)
    expect(test_3).to eq(115.0)
    expect(test_4).to eq(118.0)
    expect(test_5).to eq(118.0)
    expect(test_6).to eq(120.0)
    expect(test_7).to eq(100.0)
  end
end
