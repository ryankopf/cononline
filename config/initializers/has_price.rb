module HasPrice
  include HasMoney
  attr_accessor :price_text
  attr_accessor :shipping_price_text

  def update_price
    self.price = string_to_integer(price_text) unless price_text.blank?
    self.shipping_price = string_to_integer(shipping_price_text) unless shipping_price_text.blank?
  end
  def get_price(quantity = 1)
    return 0 if self.price.nil?
    integer_to_string(self.price * quantity)
  end
  def get_shipping_price
    return 0 if self.shipping_price.nil?
    integer_to_string(self.shipping_price)
  end
  def get_combined_price
    integer_to_string((self.price||0) + (self.shipping_price||0))
  end

end