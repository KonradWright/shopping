class Discount
  
  attr_reader :name, :disc_item_id, :disc_percent, :disc_requirements
  
  def initialize(options = {})
    @name = options[:name] || "(discount not named)"
    @disc_percent = options[:disc_percent] || 0
    @disc_requirements = options[:disc_requirements] || []
  end
  
  def to_s
    name
  end
end