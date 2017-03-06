require 'rspec'

describe 'Delegator' do
  it 'can take an invoice as an argument and add functionality on top of the class' do
    invoice = Invoice.new('Kristine Hudgens')
    decorated_invoice = InvoiceDecorator.new(invoice)
    expect(decorated_invoice.invoice_month).to eq(9)
  end

  it 'can work with data from the class' do
    invoice = Invoice.new('Kristine Hudgens')
    decorated_invoice = InvoiceDecorator.new(invoice)
    expect(decorated_invoice.last_name).to eq('Hudgens')
  end

  it 'can access the decorated object' do
    invoice = Invoice.new('Kristine Hudgens')
    decorated_invoice = InvoiceDecorator.new(invoice)
    expect(decorated_invoice.__getobj__).to eq(invoice)
  end
end

