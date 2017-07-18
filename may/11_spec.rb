require 'rspec'

module AddressFormatter
  def self.format(address_obj)
    str_address = <<~ADDRESS
      #{address_obj[:account]}
      #{address_obj[:street_one]}
      #{address_obj[:street_two]}
      #{address_obj[:city]}, #{address_obj[:state]} #{address_obj[:postal_code]}
    ADDRESS
    str_address.gsub /^$\n/, ''
  end
end

describe AddressFormatter do
  it 'takes in an address as a hash and outputs a formatted string' do
    address_data = {
      'account':     'Google',
      'street_one':  '1600 Amphitheatre Parkway',
      'street_two':  nil,
      'city':        'Mountain View',
      'state':       'CA',
      'postal_code': '94043'
    }

    formatted_address = <<~ADDRESS
      Google
      1600 Amphitheatre Parkway
      Mountain View, CA 94043
    ADDRESS

    expect(AddressFormatter.format(address_data)).to eq(formatted_address)
  end
end
