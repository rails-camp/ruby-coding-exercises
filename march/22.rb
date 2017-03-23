require 'rspec'

val = 0

proc_process = -> {}

def some_method
end

describe 'Proc/lambda vs method' do
  it 'can access a variable outside its scope and process it' do
    proc_process.call
    proc_process.call
    proc_process.call
    expect(proc_process.call).to eq(4)
  end

  it 'will raise an error when trying to access a local variable outside its scope' do
    expect { some_method }.to raise_error(NoMethodError)
  end
end

