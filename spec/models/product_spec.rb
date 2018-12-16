require 'rails_helper'

RSpec.describe Product, type: :model do
  context 'validation tests' do
    it 'successful test minimum amount of fields' do
      product = Product.new(number: 101202, name: 'Training gloves').save;
      expect(product).to eq(true);
    end

    it 'successful test with price' do
      product = Product.new(number: 101203, name: 'Silky gloves', price:99.99).save;
      expect(product).to eq(true);
    end

    it 'successful test with description' do
      product = Product.new(number: 101204, name: 'Winter leather gloves', description: 'they will keep you warm').save;
      expect(product).to eq(true);
    end

    it 'successful test with all fields' do
      product = Product.new(number: 101205, name: 'Wool gloves', price:69.99, description: 'not so comfy').save;
      expect(product).to eq(true);
    end

    it 'validates number' do
      product = Product.new(name: 'Dark beer', price:29.99, description: 'strong taste').save;
      expect(product).to eq(false);
    end

    it 'validates name' do
      product = Product.new(number: 189321, price:129.99, description: 'strong taste').save;
      expect(product).to eq(false);
    end

    it 'validates number and name' do
      product = Product.new(price:229.99, description: 'piece of metal to pierce wood').save;
      expect(product).to eq(false);
    end
  end

  context 'scope tests' do
    before(:each) do
      Product.new(number: 101202, name: 'Training gloves', price:59.99, description: 'Protect your hands while trainign.').save;
      Product.new(number: 101203, name: 'Winter gloves', price:129.99).save;
      Product.new(number: 101204, name: 'Wool gloves', description: 'not so comfy').save;
      Product.new(number: 101333, name: 'Dark beer').save;
      Product.new(number: 105890, name: 'Metal stick', price:229.99).save;
    end

    it 'valid count of missing price' do
      expect(Product.missing_price.size).to eq(2);
    end

    it 'invalid count of missing description' do
      expect(Product.missing_description.size).to eq(3);
    end
  end
end
