require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # initial example
    it 'ensures a product with all four fields set will save successfully' do
      category = Category.new(name: 'x')
      product = Product.new(name: 'y', price: 500, quantity: 10, category: category)
      expect(product).to be_valid
    end

    # validates :name, presence: true
    # validates :price, presence: true
    # validates :quantity, presence: true
    # validates :category, presence: true
  end
end
