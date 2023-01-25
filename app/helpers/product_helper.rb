module ProductHelper
  def sold_out?(product)
    product.quantity === 0
  end
  def add_cart_button?(product)
    self.sold_out?(product)
  end
end
