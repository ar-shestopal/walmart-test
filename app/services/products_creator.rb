class ProductsCreator
  attr_reader :errors

  def initialize(code)
    @adapter = WalmartAdapter.new(code)
    @errors = []
  end

  def create
    create_product
    create_reviews if errors?
  end

  def errors?
    @errors.empty?
  end

  private

  def create_product
    product = @adapter.product
    @product = Product.create(product)
    @errors << @product
      .errors.full_messages.join(',') unless @product.valid?
  end

  # Methods creates review, iterating over results,
  # which might cause performance issues for bit amount of data
  # but is faster implement
  def create_reviews
    return unless errors?
    reviews = @adapter.reviews
    reviews.each do |review|
      new_review = @product.reviews.create(review)
      @errors << new_review
        .errors.fill_messages.join(',') unless new_review.valid?
    end
  end
end
