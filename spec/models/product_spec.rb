require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it('should create a product') do
      @category = Category.find_or_create_by! name: 'Books'
      expect {
        @category.products.create({
          name: 'Harry Potter',
          price_cents: '950',
          quantity: 1
        })
      }.to change {Product.count}
    end

    it('should validate a :name, presence to true') do
      @category = Category.find_or_create_by! name: 'Sample'
      expect {
        @category.products.create({
          name: nil,
          price: '950',
          quantity: 1
        })
      }.not_to change {Product.count}
    end

    it('should validate a :price, presence to true') do
      @category = Category.find_or_create_by! name: 'Sample'
      expect {
        @category.products.create({
        name: 'Red Crayon',
        price: nil,
        quantity: 1
      })
    }.not_to change {Product.count}
    end

    it('should validate a :quantity, presence to true') do
      @category = Category.find_or_create_by! name: 'Sample'
      expect {
        @category.products.create({
        name: 'Brown Chair',
        price: '950',
        quantity: nil
      })
    }.not_to change {Product.count}
    end

    it('should validate a :category, presence to true') do
      expect {
        Product.create({
        name: 'Silver Laptop',
        price: '950',
        quantity: 1
      })
    }.not_to change {Product.count}
    end
  end
end
