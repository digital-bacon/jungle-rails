require 'rails_helper'

RSpec.describe Product, type: :model do

  before(:each) do
    @category = Category.find_or_create_by! name: 'Test Category name'
    @product = Product.new(name: 'Test Product Name', price: 23.21, quantity: 3, category: @category)
  end

  describe "validations" do
    it "should create a product when there are no validation errors" do
      @product.save
      expect(@product.errors).to be_empty
    end

    it "should not allow a product to be created without a name" do
      @product.name = nil
      @product.save
      expect(@product.errors[:name]).to be_present
    end
  end
end
