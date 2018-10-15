require 'rspec'

headers = [
  '1B',
  '2B',
  '3B',
  'SS',
  'C',
  'P',
  'LF',
  'CF',
  'RF'
]

astros = [
  'Gurriel',
  'Altuve',
  'Bregman',
  'Correa',
  'Gattis',
  'Keuchel',
  'Beltran',
  'Springer',
  'Reddick'
]

rangers = [
  'Fielder',
  'Andrus',
  'Odor',
  'Beltre',
  'Lucroy',
  'Darvish',
  'Gomez',
  'Choo',
  'Mazara'
]

def position_filter(headers, *data)
  headers.zip(*data)
end

# .zip walks over each of the collections, collecting one element from each and returning the resulting collected array. It then repeats that process until it’s made one pass over each element from the collections. The resulting arrays from each of these passes is collected and returned as an array of those collected arrays.


position_filter(headers, astros, rangers)

describe 'Position Filter' do
  it 'lines up players with their positions' do
    test_headers = ['1B', '2B', 'P']
    test_team = ['First Base Player', 'Second Base Player', 'Pitcher']
    expect(position_filter(test_headers, test_team).first).to eq(['1B', 'First Base Player'])
  end
end
