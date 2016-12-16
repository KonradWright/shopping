require 'item'

describe Item do
  before do
    @item = Item.new("001", 100)
  end
  it 'has the ID "001"' do
    expect(@item.id).to eq "001"
  end
  it 'has a price of 100' do
    expect(@item.price).to eq 100
  end
end