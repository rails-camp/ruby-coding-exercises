require 'rspec'

describe MetaHi do
  before do
    @mh = MetaHi.new
  end

  it 'uses meta programming to allow for dynamic method calls starting with hi_' do
    expect(@mh.respond_to?(:hi_jon)).to eq(true)
    expect(@mh.respond_to?(:hi_jane)).to eq(true)
  end

  it 'returns a greeting based on the name provided by the method' do
    expect(@mh.hi_jon).to eq('Hi Jon!')
    expect(@mh.hi_kristine).to eq('Hi Kristine!')
    expect(@mh.hi_gabrielle).to eq('Hi Gabrielle!')
  end
end

