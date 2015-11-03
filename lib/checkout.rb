class Checkout
  def initialize
    @price_list = {
      Apple: 50,
      Aspirin: 28
    }
    @basket = []
  end

  def scan(item)
    if @price_list.has_key?(item.to_sym) == false
        raise "Item not found: #{item}"
    end

    @basket.push(item)
  end

  def total
    total = @basket.count("Apple") * @price_list[:Apple] +
            @basket.count("Aspirin") * @price_list[:Aspirin]
  end
end
