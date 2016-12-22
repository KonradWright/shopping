require_relative 'item'

class Cart
  
  attr_accessor :items, :name
  
  def initialize(name, options = {})
    @name = name || '(cart not named)'
    @items = options[:items] || []
  end
  
  def to_s
    "#{@name}'s Cart"
  end
  
  def total
    #Apply each discount
    #Sum up the discounts
    cart_total = 0
    for item in @items do
      cart_total += item.price
    end
    #Return the discounted total
    cart_total
  end
end