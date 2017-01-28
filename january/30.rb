require 'rspec'

class ApiConnector
  attr_accessor :attempts, :errors

  def initialize
    @attempts = 0
    @errors = []
  end

  def send_data
    begin
      @attempts += 1
      api_call
    rescue Errno::ETIMEDOUT => e
      @errors << e
      retry if @attempts < 3
    end
  end

  def api_call
    raise Errno::ETIMEDOUT
  end
end

describe 'ApiConnector' do
it 'attempts to connect with an API 3 times and stores the errors in an array' do
  api = ApiConnector.new
    api.send_data
    expect(api.attempts).to eq(3)
    expect(api.errors.to_s).to eq("[#<Errno::ETIMEDOUT: Operation timed out>, #<Errno::ETIMEDOUT: Operation timed out>, #<Errno::ETIMEDOUT: Operation timed out>]")
  end
end
