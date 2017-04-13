require 'rspec'

describe 'file_searcher' do
  it 'can pass a query to a text file and return the lines that include the query' do
    expect(file_searcher('support/emails.txt', 'Death Star')).to eq([
        "Death Star: A Primer",
        "Death Star Potential Vulnerabilities",
        "Meeting to Discuss Death Star?",
        "Death Star Project Plans"
      ])
  end
end

