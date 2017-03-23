require 'rspec'

describe 'Lambdas vs methods' do
  it 'shows that methods can be passed multiple blocks when leveraging lambdas' do
    status = user_update 'Tiffany', location_query.call(53.23, -123.32), time_query.call
    expect(status).to eq("Name: Tiffany\nLocation: 53.23, -123.32\nTime: #{Time.now}\n")
  end
end

