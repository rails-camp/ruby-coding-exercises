require 'rspec'

def all_palindromes(num, str)
  str.split.keep_if { |e| e.size == num }.
    select { |pl| pl.downcase == pl.downcase.reverse }
end

describe 'all_palindromes' do
  it 'can return all palindomes of a given size' do
    str = 'I am going to jump into my racecar and see tacocat'
    str_with_different_cases = 'Time to jump into my racEcAr and see Tacocat'
    expect(all_palindromes(7, str)).to eq(['racecar', 'tacocat'])
    expect(all_palindromes(7, str_with_different_cases)).to eq(['racEcAr', 'Tacocat'])
    expect(all_palindromes(1, str)).to eq(['I'])
  end

  it 'returns an empty array if no palidromes of the given size are found' do
    str = 'I am going to jump into my racecar and see tacocat'
    empty_str = ''
    expect(all_palindromes(3, str)).to eq([])
    expect(all_palindromes(7, empty_str)).to eq([])
  end
end
