class Discount
  
  attr_reader :name, :item_id, :disc_percent, :requirements
  
  def initialize(options = {})
    @name = options[:name] || "(discount not named)"
    @item_id = options[:item_id] || 0
    @disc_percent = options[:disc_percent] || 0
    @requirements = options[:requirements] || []
  end
  
  def to_s
    name
  end
end