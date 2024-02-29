require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # initial example
    it 'ensures a product with all four fields setwill save successfully' do
      category = Category.new(name: 'x')
      category.save
      product = Product.new(name: 'y', price: 500, quantity: 10, category: category)
      product.save
      expect(product).to be_valid
    end

    # validates :name, presence: true
    # validates :price, presence: true
    # validates :quantity, presence: true
    # validates :category, presence: true
  end
end
