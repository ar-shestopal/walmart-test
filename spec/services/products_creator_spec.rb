require 'rails_helper'

RSpec.describe ProductsCreator, type: :model do
  describe 'products creation' do
    before :each do
      stub_walmart_api
    end

    it 'should create product' do
      ProductsCreator.new(@code).create
      expect(Product.count).to eq 1
    end

    it 'should create list of reviews' do
      ProductsCreator.new(@code).create
      product = Product.first
      expect(product.reviews.count).to eq 1
    end
  end
end
