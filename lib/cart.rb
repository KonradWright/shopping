require_relative 'item'
require_relative 'discount'

class Cart
  
  attr_accessor :name, :items, :discounts
  
  def initialize(name, options = {})
    @name = name || '(cart not named)'
    @items = options[:items] || []
    @discounts = options[:discounts] || []
  end
  
  def to_s
    "#{@name}'s Cart"
  end
  
  def total
    #Apply each discount
    discounted_box = []
    
    for item in @items do
      best_discount = Discount.new()
      
      for discount in @discounts do
        if (discount.item_id == item.id)
          if (discount.requirements.count != 0)
          end
          
          if (item.priceWithDiscount(best_discount) > item.priceWithDiscount(discount))
            best_discount = discount
          end
        end
      end
      
      discounted_box << [item, best_discount]
    end
    #Sum up the discounts
    cart_total = 0
    for i in 0..(discounted_box.count-1) do
      cart_total += discounted_box[i][0].priceWithDiscount(discounted_box[i][1])
    end
    #Return the discounted total
    cart_total
  end
end