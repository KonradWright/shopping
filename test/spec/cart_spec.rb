require 'cart'

describe Cart do
  before do
    @cart = Cart.new("John")
  end
  it 'has the name "John"' do
    expect(@cart.name).to eq "John"
  end
  it 'has no items' do
    expect(@cart.items.count).to eq 0
  end
  it 'has a total of 0' do
    expect(@cart.total).to eq 0
  end
end