require 'rspec'

Node = Struct.new(:prev, :next, :val)

x = Node.new(nil, nil, 5)

y = Node.new(x, nil, 10)

x.next = y

x
y

x.prev
x.next

class LinkedList
end

describe LinkedList do
  before do
    @x = Node.new(nil, z, 5)
    @y = Node.new(x, z, 9)
    @z = Node.new(y, nil, 10)
  end

  it 'can return a full list of values' do
  end
end
