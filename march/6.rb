require 'rspec'

module InvoiceHelper
  def taxable? source
    if source == 'online' or source == 'AZ'
      true
    else
      false
    end
  end
end

class Sale
  include InvoiceHelper

  def initialize(total, source)
    @source = source
    @total = total
  end

  def place_order
    return (@total + (@total * 0.06)) if taxable? @source
    @total
  end
end

describe 'Tax helper' do
  it 'calculates the correct tax amount if source is online or AZ' do
    s = Sale.new(500, 'AZ')
    expect(s.place_order).to eq(530.0)
  end

  it 'Ensures that an InvoiceHelper module has been included in the class' do
    s = Sale.new(500, 'AZ')
    expect((class << s; self; end).included_modules.first).to eq(InvoiceHelper)
  end
end
