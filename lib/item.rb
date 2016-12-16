class Item
  
  attr_reader :id, :name, :price
  
  def initialize(id, price, options = {})
    @id = id
    @price = price
    @name = options[:name] || "(item not named)"
  end
  
  def to_s
    formatted_price = sprintf("$%2.2f", @price)
    "#{id} - #{formatted_price}: #{@name}"
  end
  
end