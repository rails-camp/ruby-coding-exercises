require 'rspec'

def url_matcher
  %r{
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

def content
  c = File.read('support/march_28_markdown_one.md')
  c << File.read('support/march_28_markdown_two.md')
  c << File.read('support/march_28_markdown_three.md')
  c << File.read('support/march_28_markdown_four.md')
  c
end

def syllabus_parser
  # Implementation goes here
end

describe 'markdown_parser' do
  it 'parses a markdown file and groups elements into categories' do
    three = {
      :guide=>
        [
          "https://rails.devcamp.com/daily-ruby-code-practice-exercises/december/create-array-converter-method-ruby",
          "https://rails.devcamp.com/html-css-coding-bootcamp/guide-html/creating-page-components-div-tag",
          "https://rails.devcamp.com/html-css-coding-bootcamp/guide-html/implementing-inline-components-span-tag",
          "https://rails.devcamp.com/html-css-coding-bootcamp/guide-html/html-headings",
          "https://rails.devcamp.com/html-css-coding-bootcamp/guide-html/multi-line-content-paragraph-tags",
          "https://rails.devcamp.com/html-css-coding-bootcamp/guide-html/html-hyperlinks",
          "https://rails.devcamp.com/html-css-coding-bootcamp/guide-html/page-breaks-horizontal-rule-tag",
          "https://rails.devcamp.com/html-css-coding-bootcamp/guide-html/line-breaks-html-pages"
        ],
      :campsite=>
        [
          "http://rails.devcamp.com/trails/dissecting-rails-5/campsites/implementing-version-control",
          "https://rails.devcamp.com/trails/ruby-programming/campsites/ruby-variables"
        ]
    }

    seven = {
      :guide=>
        [
          "https://rails.devcamp.com/daily-ruby-code-practice-exercises/december/converting-hash-url-friendly-string-ruby",
          "https://rails.devcamp.com/html-css-coding-bootcamp/guide-html/html-ids",
          "https://rails.devcamp.com/html-css-coding-bootcamp/guide-html/html-classes"
        ],
      :campsite=>
        [
          "https://rails.devcamp.com/trails/dissecting-rails-5/campsites/rails-5-authentication",
          "https://rails.devcamp.com/trails/ruby-programming/campsites/ruby-methods"
        ]
    }

    expect(syllabus_parser['three']).to eq(three)
    expect(syllabus_parser['seven']).to eq(seven)
  end
end
