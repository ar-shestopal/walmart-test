class Review < ActiveRecord::Base
  belongs_to :product

  validates :product, presence: true
  # Validate uniqueness of review per product
  validates :author, uniqueness: { scope: :product_id }
end
