require 'rspec'
require 'pry'

def csv_to_hash file_path
  lines = File.read(file_path).split(/\r\n/).map do |line|
    line.split(',')
  end

  hash = Hash[lines.first.map do |x|
    [x, []]
  end]

  binding.pry
end

csv_to_hash('support/crm.csv')
