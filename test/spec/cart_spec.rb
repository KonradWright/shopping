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
  context 'has one item' do
    before do
      @cart.items << Item.new(1,100,name:"Bread")
    end
    it 'has one item' do
      expect(@cart.items.count).to eq 1
    end
    it 'has a total of 100' do
      expect(@cart.total).to eq 100
    end
    context 'that has a discount of 10% off' do
      before do
        @cart.discounts << Discount.new(name:"Bread 10% off!", item_id: 1, disc_percent:0.1)
      end
      it 'has a total of 90' do
        expect(@cart.total).to eq 90
      end
      context 'that has a discount of 20% off' do
        before do
          @cart.discounts << Discount.new(name:"Bread 20% off!", item_id: 1, disc_percent:0.2)
        end
        it 'has a total of 80' do
          expect(@cart.total).to eq 80
        end
      end
    end
  end
  context 'has two items' do
    before do
      @cart.items << Item.new(1,100,name:"Bread")
      @cart.items << Item.new(1,100,name:"Bread")
    end
    it 'has two items' do
      expect(@cart.items.count).to eq 2
    end
    it 'has a totoal of 200' do
      expect(@cart.total).to eq 200
    end
  end
end