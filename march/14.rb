require 'rspec'

def heredoc_refactor
  <<-EOL
    Some
    words
    in a heredoc
  EOL
end

puts heredoc_refactor

describe 'Heredoc refactor' do
  it 'does not have leading spaces on each line' do
    expect(heredoc_refactor).to eq("Some\nwords\nin a heredoc\n")
  end
end

