require 'rspec'

location_query = ->(lat, long) do
  "#{lat}, #{long}"
end

time_query = -> do
  Time.now
end

def user_update name, set_location, pinged_at
  <<~EOL
    Name: #{name}
    Location: #{set_location}
    Time: #{pinged_at}
  EOL
end

describe 'Lambdas vs methods' do
  it 'shows that methods can be passed multiple blocks when leveraging lambdas' do
    status = user_update 'Tiffany', location_query.call(53.23, -123.32), time_query.call
    expect(status).to eq("Name: Tiffany\nLocation: 53.23, -123.32\nTime: #{Time.now}\n")
  end
end


