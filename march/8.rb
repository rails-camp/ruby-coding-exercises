require 'attr_extras'

class PurchaseOrder
  attr_accessor_initialize :client, :total

  def generate_order
    "#{client}: #{total}"
  end
end

describe 'Attr Extra refactor' do
  it 'can be created with a client and total' do
    po = PurchaseOrder.new('Google', 500)
    expect(po.generate_order).to eq('Google: 500')
  end

  it 'allows the client value to be changed' do
    po = PurchaseOrder.new('Google', 500)
    po.client = "Yahoo"
    expect(po.client).to eq('Yahoo')
  end
end
