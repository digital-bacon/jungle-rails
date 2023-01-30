require 'rails_helper'

RSpec.describe Product, type: :model do

  before(:each) do
    @category = Category.find_or_create_by! name: 'Test Category name'
    @product = Product.new(name: 'Test Product Name', price: 23.21, quantity: 3, category: @category)
  end

  describe "validation" do
    context "when given valid product inputs" do
      it "should create a product with no errors" do
        @product.save
        expect(@product.errors).to be_empty
      end
    end

    context "when given an empty name" do
      it "should not allow a product to be created and return an error" do
        @product.name = nil
        @product.save
        expect(@product.errors[:name]).to include("can't be blank")
      end
    end

    context "when given an empty price" do
      it "should not allow a product to be created and return an error" do
        @product.price = nil
        @product.price_cents = nil
        @product.save
        expect(@product.errors[:price]).to include("can't be blank")
      end
    end

    context "when given an empty quantity" do
      it "should not allow a product to be created and return an error" do
        @product.quantity = nil
        @product.save
        expect(@product.errors[:quantity]).to include("can't be blank")
      end
    end

    context "when given an empty category" do
      it "should not allow a product to be created and return an error" do
        @product.category = nil
        @product.save
        expect(@product.errors[:category]).to include("can't be blank")
      end
    end
  end
end
