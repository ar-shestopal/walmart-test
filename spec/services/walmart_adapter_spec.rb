require 'rails_helper'

RSpec.describe WalmartAdapter, type: :model do
  describe 'products lookup' do
    before :each do
      stub_walmart_api
    end
    it 'should return product from walmart' do
      product = WalmartAdapter.new(@code).product
      expect(product['name']).to eq 'Name'
    end

    it 'should return list of reviews' do
      reviews = WalmartAdapter.new(@code).reviews
      expect(reviews.size).to eq 1
      expect(reviews.first[:author]).to eq 'NurseParker'
    end
  end
end
