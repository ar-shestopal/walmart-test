class WalmartAdapter
  include HTTParty

  # API KEY should be moved to ENV
  API_KEY = 'cx9tfuz5rkxs9zkq6u4h6yp3'
  base_uri 'api.walmartlabs.com/v1'

  def initialize(code)
    @code = code
  end

  def product
    product = self.class.get "/items/#{@code}?apiKey="\
                             "#{API_KEY}&format=json"
    { name: product['name'], price: product['price'].to_f }
  end

  def reviews
    reviews = []
    request = self.class.get "/reviews/#{@code}?apiKey="\
                             "#{API_KEY}&format=json"
    request['reviews'].each do |review|
      reviews << { author: review['reviewer'],
                   rate: review['overallRating']['rating'] }
    end
    reviews
  end
end
