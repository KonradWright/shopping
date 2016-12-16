require 'cart'

describe Cart do
  before do
    @cart = Cart.new("John")
  end
  it 'has the name "John"' do
    expect(@cart.name).to eq "John"
  end
end