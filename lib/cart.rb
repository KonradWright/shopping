require_relative 'item'

class Cart
  
  attr_accessor :items, :name
  
  def initialize(name, options = {})
    @name = name
    @items = options[:items]
  end
  
  def to_s
    "#{@name}'s Cart"
  end
  
  def total
    
  end
end