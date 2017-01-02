require 'rspec'

# <!doctype html>

# <html lang="en">
# <head>
#   <meta charset="utf-8">
# 
#   <title>Title Goes Here</title>
# </head>
# 
# <body>
# </body>
# </html>

def html_generator title
end

describe 'HTML generator' do
  it 'allows for a dynamic title' do
    expect(html_generator 'My Site').to match(/My Site/)
  end
end
