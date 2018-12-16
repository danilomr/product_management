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

  end
end
