module ApplicationHelper
  def count_products
    @product_count ||= Product.count
  end

  def count_categories
    @category_count ||= Category.count
  end
end
