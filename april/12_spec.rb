require 'rspec'

class ThisForThat
  def initialize
    @companies = %w{uber airbnb google buzzfeed}
    @industries = %w{airlines skateboards hockey comics}
  end

  def builder
  end
end

describe ThisForThat do
  it 'generates a random business idea' do
    class ThisForThatForcedRandom < ThisForThat
      def builder
        srand 1
        super
      end
    end

    idea = ThisForThatForcedRandom.new.builder
    expect(idea).to eq("It's like airbnb for comics")
  end
end

