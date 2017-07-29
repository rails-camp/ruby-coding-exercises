require 'rspec'
require 'pry'

class Array
  def nested_add_and_resort(hash)
    obj_sort_order_max = self.map { |e| e[:sort_order] }.max
    category_sort_order_max = self.map { |e| e[:category][:sort_order] }.max

    if !hash[:sort_order]
      hash[:sort_order] = (obj_sort_order_max + 1)
    end
    self << hash
  end
end

collection = [
  {title: 'Week 1 Title',     category: {title: 'Week 1', sort_order: 1}, sort_order: 1},
  {title: 'Week 2 1st Title', category: {title: 'Week 2', sort_order: 2}, sort_order: 2},
  {title: 'Week 2 2nd Title', category: {title: 'Week 2', sort_order: 2}, sort_order: 3},
  {title: 'Week 2 3rd Title', category: {title: 'Week 2', sort_order: 2}, sort_order: 4},
  {title: 'Week 2 4th Title', category: {title: 'Week 2', sort_order: 2}, sort_order: 5},
  {title: 'Week 2 5th Title', category: {title: 'Week 2', sort_order: 2}, sort_order: 6},
  {title: 'Week 3 1st Title', category: {title: 'Week 3', sort_order: 3}, sort_order: 7},
  {title: 'Week 3 2nd Title', category: {title: 'Week 3', sort_order: 3}, sort_order: 8},
]

# TODO: Next figure out how to get the new item to be placed at the end of the
# week 2 collection and then auto update the other items in week 3+
new_item = {title: 'Third Title', category: {title: 'Week 2', sort_order: 2}}
collection.nested_add_and_resort(new_item)
collection

describe 'add_and_resort' do
  it 'properly adds a hash to the end of a collection and assigns the sort_order if none is supplied' do
    collection = [
      {title: 'My Title',      category: {title: 'Week 1', sort_order: 1}, sort_order: 1},
      {title: 'Another Title', category: {title: 'Week 2', sort_order: 2}, sort_order: 2}
    ]

    new_item = {title: 'Third Title', category: {title: 'Week 2', sort_order: 2}}

    expect(collection.nested_add_and_resort(new_item)).to eq(
      [
        {title: 'My Title',      category: {title: 'Week 1', sort_order: 1}, sort_order: 1},
        {title: 'Another Title', category: {title: 'Week 2', sort_order: 2}, sort_order: 2},
        {title: 'Third Title',   category: {title: 'Week 2', sort_order: 2}, sort_order: 3}
      ]
    )
  end

  it 'auto updates the sort order for any elements after it if inserted in an earlier week' do
    collection = [
      {title: 'My Title',      category: {title: 'Week 1', sort_order: 1}, sort_order: 1},
      {title: 'Another Title', category: {title: 'Week 2', sort_order: 2}, sort_order: 2}
    ]

    new_item = {title: 'Third Title', category: {title: 'Week 1', sort_order: 2}}

    expect(collection.nested_add_and_resort(new_item)).to eq(
      [
        {title: 'My Title',      category: {title: 'Week 1', sort_order: 1}, sort_order: 1},
        {title: 'Another Title', category: {title: 'Week 2', sort_order: 2}, sort_order: 3},
        {title: 'Third Title',   category: {title: 'Week 1', sort_order: 2}, sort_order: 2}
      ]
    )

  end

  xit 're sorts the collection of sort order values if a sort order is declared' do

  end
end
