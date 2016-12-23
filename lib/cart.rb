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
    discounted_box = []
    used_items = []
    
    for item in @items do
      best_discount = Discount.new()
      best_reqs = []
      
      for discount in @discounts do
        if (discount.item_id == item.id)
          req_met_flag = true
          if (discount.requirements.count != 0)
            temp_used_items = []
            
            for req in discount.requirements do
              for i in @items do
                
                if (req == i.id)
                  item_is_being_used = false
                  
                  if (i == item)
                    item_is_being_used = true
                  end
                  
                  for used_item in used_items do
                    if (used_item == i)
                      item_is_being_used = true
                    end
                  end
                  
                  for used_item in temp_used_items do
                    if (used_item == i)
                      item_is_being_used = true
                    end
                  end
                  
                  if (!item_is_being_used)
                    temp_used_items << i
                    break
                  end
                end
              end
            end
            
            if (temp_used_items.count != discount.requirements.count)
              req_met_flag = false
            end
          end
          
          if (item.priceWithDiscount(best_discount) > item.priceWithDiscount(discount) and req_met_flag)
            best_discount = discount
            best_reqs = temp_used_items || []
          end
        end
      end
      
      for used_item in best_reqs do
        used_items << used_item
      end
      
      used_items << item
      discounted_box << [item, best_discount]
    end
    
    cart_total = 0
    for i in 0..(discounted_box.count-1) do
      cart_total += discounted_box[i][0].priceWithDiscount(discounted_box[i][1])
    end
    
    cart_total
  end
end