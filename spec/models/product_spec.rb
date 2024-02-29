require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'successfully saves a product with all four fields set' do
      category = Category.new(name: 'x')
      product = Product.new(name: 'y', price_cents: 500, quantity: 10, category: category)
      expect(product).to be_valid
    end

    it 'returns an error when :name is not present' do
      category = Category.new(name: 'x')
      product = Product.new(name: nil, price_cents: 500, quantity: 10, category: category)
      expect(product).to_not be_valid
      expect(product.errors.full_messages).to include("Name can't be blank")
    end

    it 'returns an error when :price_cents is not present' do
      category = Category.new(name: 'x')
      product = Product.new(name: 'y', price_cents: nil, quantity: 10, category: category)
      expect(product).to_not be_valid
      expect(product.errors.full_messages).to include("Price can't be blank")
    end

    it 'returns an error when :quantity is not present' do
      category = Category.new(name: 'x')
      product = Product.new(name: 'y', price_cents: 500, quantity: nil, category: category)
      expect(product).to_not be_valid
      expect(product.errors.full_messages).to include("Quantity can't be blank")
    end

    it 'returns an error when :price is not present' do
      category = Category.new(name: 'x')
      product = Product.new(name: 'y', price_cents: 500, quantity: 10, category: nil)
      expect(product).to_not be_valid
      expect(product.errors.full_messages).to include("Category can't be blank")
    end
  end
end
