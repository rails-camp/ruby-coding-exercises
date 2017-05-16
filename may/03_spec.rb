require 'rspec'

class CondoMapper
  def initialize(num)
    @n = num
  end

  define_method(:floor) { @n[0] }
  define_method(:building) { @n[1] }

  def unit
    @n.slice!(0..1)
    @n
  end
end

describe CondoMapper do
  it 'returns the building, floor level, and unit number based on the condo number' do
    cm = CondoMapper.new('4205')
    expect(cm.floor).to eq('4')
    expect(cm.building).to eq('2')
    expect(cm.unit).to eq('05')

    cm2 = CondoMapper.new('71105')
    expect(cm2.floor).to eq('7')
    expect(cm2.building).to eq('1')
    expect(cm2.unit).to eq('105')
  end
end
