require 'rspec'

def url_parser str
  regex = %r{
    \b
    (
      (?: [a-z][\w-]+:
       (?: /{1,3} | [a-z0-9%] ) |
        www\d{0,3}[.] |
        [a-z0-9.\-]+[.][a-z]{2,4}/
      )
      (?:
       [^\s()<>]+ | \(([^\s()<>]+|(\([^\s()<>]+\)))*\)
      )+
      (?:
        \(([^\s()<>]+|(\([^\s()<>]+\)))*\) |
        [^\s`!()\[\]{};:'".,<>?«»“”‘’]
      )
    )
  }ix
end

describe 'URL Parser' do
  it 'converts strings that contain URLs into HTML links' do
    str_one = "Some content without a link."
    str_two = "Content with a link that has a period after it https://devcamp.com."
    str_three = "https://devcamp.com that starts at the beginning"

    expect(url_parser str_one).to eq("Some content without a link.")
    expect(url_parser str_two).to eq("Content with a link that has a period after it <a href='https://devcamp.com' target='_blank'>https://devcamp.com</a>.")
    expect(url_parser str_three).to eq("<a href='https://devcamp.com' target='_blank'>https://devcamp.com</a> that starts at the beginning")
  end
end

